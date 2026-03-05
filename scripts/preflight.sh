#!/usr/bin/env bash
set -euo pipefail

ROOT="${PREFLIGHT_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"
INDEX="$ROOT/backlog/index.md"

ROLE_FILTER="${ROLE:-}"
if [[ "${1:-}" == "--role" ]]; then
  ROLE_FILTER="${2:-}"
fi

trim() {
  local s="$1"
  s="${s#"${s%%[![:space:]]*}"}"
  s="${s%"${s##*[![:space:]]}"}"
  printf "%s" "$s"
}

normalize_roles() {
  local roles="$1"
  if [[ -z "$(trim "$roles")" ]]; then
    printf ""
    return
  fi
  printf "%s\n" "$roles" \
    | tr ',' '\n' \
    | sed 's/^[[:space:]]*//; s/[[:space:]]*$//' \
    | sed '/^$/d' \
    | sort -u \
    | paste -sd',' -
}

get_item_status() {
  local item="$1"
  awk '
    /^## Status/ {
      getline
      gsub(/^- /, "", $0)
      gsub(/\./, "", $0)
      gsub(/^[[:space:]]+|[[:space:]]+$/, "", $0)
      print $0
      exit
    }
  ' "$item"
}

get_gate_state() {
  local item="$1"
  local role="$2"
  awk -F'|' -v role="$role" '
    function trim(x) { gsub(/^[[:space:]]+|[[:space:]]+$/, "", x); return x }
    /^\|/ {
      r = trim($2)
      s = trim($3)
      if (r == role) {
        print s
        exit
      }
    }
  ' "$item"
}

derive_expected_next() {
  local status="$1"
  local impl="$2"
  local qe="$3"
  local se="$4"
  local reviewer="$5"
  local re="$6"
  local arch="$7"

  case "$status" in
    intake)
      printf "Product Owner"
      ;;
    shaped)
      if [[ "$arch" != "done" ]]; then
        printf "Architect"
      elif [[ "$re" != "done" ]]; then
        printf "Requirements Engineer"
      else
        # shaped while both done is inconsistent, but RE owns ready transition.
        printf "Requirements Engineer"
      fi
      ;;
    ready)
      printf "Implementing Developer"
      ;;
    in-progress)
      if [[ "$impl" != "done" ]]; then
        printf "Implementing Developer"
        return
      fi

      local pending=()
      if [[ "$qe" != "done" ]]; then
        pending+=("Quality Engineer")
      fi
      if [[ "$se" != "done" ]]; then
        pending+=("Security Engineer")
      fi

      if [[ "${#pending[@]}" -gt 0 ]]; then
        IFS=','; printf "%s" "${pending[*]}"; IFS=$' \t\n'
      elif [[ "$reviewer" != "done" ]]; then
        printf "Reviewing Developer"
      else
        printf ""
      fi
      ;;
    review)
      printf "Reviewing Developer"
      ;;
    *)
      printf ""
      ;;
  esac
}

errors=0
warnings=0
role_first_match=""

mapfile -t rows < <(
  awk -F'|' '
    function trim(x) { gsub(/^[[:space:]]+|[[:space:]]+$/, "", x); return x }
    /^\| PB-/ {
      id = trim($2)
      status = trim($5)
      next_roles = trim($7)
      blocker = trim($8)
      item = trim($10)
      # Extract markdown link target "(...)"
      sub(/^.*\(/, "", item)
      sub(/\).*$/, "", item)
      print id "\t" status "\t" next_roles "\t" blocker "\t" item
    }
  ' "$INDEX"
)

if [[ "${#rows[@]}" -eq 0 ]]; then
  echo "ERROR [INDEX] no open backlog rows found or index parse failed."
  exit 1
fi

for row in "${rows[@]}"; do
  IFS=$'\t' read -r id status next_roles blocker rel_item <<< "$row"
  rel_item="$(trim "$rel_item")"
  item_path="$ROOT/backlog/${rel_item#./}"

  if [[ ! -f "$item_path" ]]; then
    echo "ERROR [$id] item file missing: $item_path"
    errors=$((errors + 1))
    continue
  fi

  item_status="$(get_item_status "$item_path")"
  if [[ "$item_status" != "$status" ]]; then
    echo "ERROR [$id] status drift: index='$status' item='$item_status'"
    errors=$((errors + 1))
  fi

  impl="$(get_gate_state "$item_path" "Implementing Developer")"
  qe="$(get_gate_state "$item_path" "Quality Engineer")"
  se="$(get_gate_state "$item_path" "Security Engineer")"
  reviewer="$(get_gate_state "$item_path" "Reviewing Developer")"
  re="$(get_gate_state "$item_path" "Requirements Engineer")"
  arch="$(get_gate_state "$item_path" "Architect")"

  expected_next="$(derive_expected_next "$status" "$impl" "$qe" "$se" "$reviewer" "$re" "$arch")"
  expected_norm="$(normalize_roles "$expected_next")"
  actual_norm="$(normalize_roles "$next_roles")"

  if [[ -n "$expected_norm" && "$actual_norm" != "$expected_norm" ]]; then
    echo "ERROR [$id] next-role drift: index='$next_roles' expected='$expected_next'"
    errors=$((errors + 1))
  fi

  if [[ "$expected_norm" == *"Quality Engineer"* || "$expected_norm" == *"Security Engineer"* ]]; then
    if [[ "$(trim "$blocker")" == "None" ]]; then
      echo "ERROR [$id] blocker should explain pending QE/SE gates"
      errors=$((errors + 1))
    fi
  fi

  if [[ -n "$ROLE_FILTER" && -z "$role_first_match" ]]; then
    if printf "%s" "$actual_norm" | tr ',' '\n' | grep -Fxq "$ROLE_FILTER"; then
      role_first_match="$id"
    fi
  fi
done

if [[ -n "$ROLE_FILTER" ]]; then
  if [[ -n "$role_first_match" ]]; then
    echo "ROLE_CHECK ok: first eligible item for '$ROLE_FILTER' is $role_first_match"
  else
    echo "ERROR [ROLE_CHECK] no eligible item found for role '$ROLE_FILTER' in index order"
    errors=$((errors + 1))
  fi
fi

if [[ "$warnings" -gt 0 ]]; then
  echo "WARN: $warnings warning(s) found."
fi

if [[ "$errors" -gt 0 ]]; then
  echo "FAIL: preflight found $errors error(s)."
  exit 1
fi

echo "OK: preflight checks passed."
