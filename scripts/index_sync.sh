#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
INDEX="$ROOT/backlog/index.md"
PB_FILTER="${PB:-}"

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
    | paste -sd', ' -
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

derive_next() {
  local status="$1"
  local impl="$2"
  local qe="$3"
  local se="$4"
  local reviewer="$5"
  local re="$6"
  local arch="$7"

  case "$status" in
    intake) printf "Product Owner" ;;
    shaped)
      if [[ "$arch" != "done" ]]; then
        printf "Architect"
      elif [[ "$re" != "done" ]]; then
        printf "Requirements Engineer"
      else
        printf "Requirements Engineer"
      fi
      ;;
    ready) printf "Implementing Developer" ;;
    in-progress)
      if [[ "$impl" != "done" ]]; then
        printf "Implementing Developer"
        return
      fi
      local pending=()
      [[ "$qe" != "done" ]] && pending+=("Quality Engineer")
      [[ "$se" != "done" ]] && pending+=("Security Engineer")
      if [[ "${#pending[@]}" -gt 0 ]]; then
        IFS=','; printf "%s" "${pending[*]}"; IFS=$' \t\n'
      elif [[ "$reviewer" != "done" ]]; then
        printf "Reviewing Developer"
      else
        printf ""
      fi
      ;;
    review) printf "Reviewing Developer" ;;
    *) printf "" ;;
  esac
}

derive_blocker() {
  local status="$1"
  local next="$2"
  local impl="$3"
  local qe="$4"
  local se="$5"
  local re="$6"
  local arch="$7"

  case "$status" in
    intake)
      printf "Awaiting Product Owner intake/shaping"
      ;;
    shaped)
      if [[ "$arch" != "done" ]]; then
        printf "Awaiting Architect gate before ready"
      elif [[ "$re" != "done" ]]; then
        printf "Awaiting Requirements Engineer gate before ready"
      else
        printf "Awaiting Requirements Engineer \`ready\` transition"
      fi
      ;;
    ready)
      printf "Awaiting implementation start (\`ready\` -> \`in-progress\`)"
      ;;
    in-progress)
      if [[ "$impl" != "done" ]]; then
        printf "Awaiting Implementing Developer gate completion"
      elif [[ "$qe" != "done" && "$se" != "done" ]]; then
        printf "Awaiting QE and SE gates before review"
      elif [[ "$qe" != "done" ]]; then
        printf "Awaiting Quality Engineer gate before review"
      elif [[ "$se" != "done" ]]; then
        printf "Awaiting Security Engineer gate before review"
      elif [[ "$next" == "Reviewing Developer" ]]; then
        printf "None"
      else
        printf "Awaiting stakeholder confirmation for \`done\` transition"
      fi
      ;;
    review)
      printf "Awaiting stakeholder confirmation for \`done\` transition"
      ;;
    *)
      printf "None"
      ;;
  esac
}

today="$(date +%F)"
tmp="$(mktemp)"
trap 'rm -f "$tmp"' EXIT

while IFS= read -r line; do
  if [[ "$line" =~ ^\|\ PB- ]]; then
    IFS='|' read -r _ id title priority status role_owner next_roles blocker updated item <<< "$line"
    id="$(trim "$id")"
    title="$(trim "$title")"
    priority="$(trim "$priority")"
    role_owner="$(trim "$role_owner")"
    item="$(trim "$item")"

    if [[ -n "$PB_FILTER" && "$id" != "$PB_FILTER" ]]; then
      echo "$line" >> "$tmp"
      continue
    fi

    rel_item="$(printf "%s" "$item" | sed -E 's/.*\(([^)]+)\).*/\1/')"
    item_path="$ROOT/backlog/${rel_item#./}"
    if [[ ! -f "$item_path" ]]; then
      echo "ERROR [$id] missing item file: $item_path" >&2
      exit 1
    fi

    item_status="$(get_item_status "$item_path")"
    impl="$(get_gate_state "$item_path" "Implementing Developer")"
    qe="$(get_gate_state "$item_path" "Quality Engineer")"
    se="$(get_gate_state "$item_path" "Security Engineer")"
    reviewer="$(get_gate_state "$item_path" "Reviewing Developer")"
    re="$(get_gate_state "$item_path" "Requirements Engineer")"
    arch="$(get_gate_state "$item_path" "Architect")"

    next_derived="$(derive_next "$item_status" "$impl" "$qe" "$se" "$reviewer" "$re" "$arch")"
    next_derived="$(normalize_roles "$next_derived")"
    blocker_derived="$(derive_blocker "$item_status" "$next_derived" "$impl" "$qe" "$se" "$re" "$arch")"

    echo "| $id | $title | $priority | $item_status | $role_owner | $next_derived | $blocker_derived | $today | $item |" >> "$tmp"
  else
    echo "$line" >> "$tmp"
  fi
done < "$INDEX"

mv "$tmp" "$INDEX"
echo "OK: backlog/index.md synced${PB_FILTER:+ for $PB_FILTER}."
