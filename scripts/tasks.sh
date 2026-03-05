#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
INDEX="$ROOT/backlog/index.md"

ROLE_FILTER="${ROLE:-}"
LIMIT="${LIMIT:-5}"

if [[ "${1:-}" == "--role" ]]; then
  ROLE_FILTER="${2:-}"
fi

if [[ "${3:-}" == "--limit" ]]; then
  LIMIT="${4:-5}"
fi

trim() {
  local s="$1"
  s="${s#"${s%%[![:space:]]*}"}"
  s="${s%"${s##*[![:space:]]}"}"
  printf "%s" "$s"
}

role_matches() {
  local role="$1"
  local next_roles="$2"

  if [[ -z "$role" ]]; then
    return 0
  fi

  local part
  while IFS= read -r part; do
    part="$(trim "$part")"
    if [[ "$part" == "$role" ]]; then
      return 0
    fi
  done < <(printf "%s\n" "$next_roles" | tr ',' '\n')

  return 1
}

count=0
echo "Tasks (role: ${ROLE_FILTER:-ALL}, limit: ${LIMIT})"

while IFS=$'\t' read -r id title priority status next_roles blocker; do
  if role_matches "$ROLE_FILTER" "$next_roles"; then
    count=$((count + 1))
    echo "${count}. ${id} | ${status} | next: ${next_roles} | blocker: ${blocker}"
    if [[ "$count" -ge "$LIMIT" ]]; then
      break
    fi
  fi
done < <(
  awk -F'|' '
    function trim(x) { gsub(/^[[:space:]]+|[[:space:]]+$/, "", x); return x }
    /^\| PB-/ {
      id = trim($2)
      title = trim($3)
      priority = trim($4)
      status = trim($5)
      next_roles = trim($7)
      blocker = trim($8)
      print id "\t" title "\t" priority "\t" status "\t" next_roles "\t" blocker
    }
  ' "$INDEX"
)

if [[ "$count" -eq 0 ]]; then
  echo "No eligible tasks found for role '${ROLE_FILTER:-ALL}'."
fi
