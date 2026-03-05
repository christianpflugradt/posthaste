#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PREFLIGHT="$SCRIPT_DIR/preflight.sh"

mkrepo() {
  local root="$1"
  mkdir -p "$root/backlog/items"
}

write_item() {
  local file="$1"
  local status="$2"
  local qe="$3"
  local se="$4"
  local impl="$5"
  local reviewer="$6"
  local re="$7"
  local arch="$8"
  cat > "$file" <<EOF_ITEM
# PB-TEST

## Status
- $status.

## Role Gate Matrix
| Role | State | Updated | Notes |
| --- | --- | --- | --- |
| Product Owner | done | 2026-03-05 | - |
| Architect | $arch | 2026-03-05 | - |
| Requirements Engineer | $re | 2026-03-05 | - |
| Quality Engineer | $qe | 2026-03-05 | - |
| Security Engineer | $se | 2026-03-05 | - |
| Implementing Developer | $impl | 2026-03-05 | - |
| Reviewing Developer | $reviewer | 2026-03-05 | - |
EOF_ITEM
}

write_index_row() {
  local file="$1"
  local id="$2"
  local status="$3"
  local next_roles="$4"
  local blocker="$5"
  local item_link="$6"
  cat > "$file" <<EOF_INDEX
# Open Backlog Index

Only open items are listed here.

| ID | Title | Priority | Status | Role Owner | Next Eligible Role(s) | Blocker | Updated | Item |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| $id | Test Item | P0 | $status | Implementing Developer | $next_roles | $blocker | 2026-03-05 | [${id}]($item_link) |
EOF_INDEX
}

expect_success() {
  local label="$1"
  shift
  if "$@"; then
    echo "PASS: $label"
  else
    echo "FAIL: $label (expected success)"
    exit 1
  fi
}

expect_failure() {
  local label="$1"
  shift
  if "$@"; then
    echo "FAIL: $label (expected failure)"
    exit 1
  else
    echo "PASS: $label"
  fi
}

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

# Case 1: valid in-progress item awaiting QE/SE.
root1="$tmp/case1"
mkrepo "$root1"
write_item "$root1/backlog/items/PB-TEST.md" "in-progress" "pending" "pending" "done" "pending" "done" "done"
write_index_row "$root1/backlog/index.md" "PB-TEST" "in-progress" "Quality Engineer, Security Engineer" "Awaiting QE and SE gates before review" "./items/PB-TEST.md"
expect_success "valid index/item state passes" env PREFLIGHT_ROOT="$root1" "$PREFLIGHT"

# Case 2: next role drift should fail.
root2="$tmp/case2"
mkrepo "$root2"
write_item "$root2/backlog/items/PB-TEST.md" "in-progress" "done" "done" "done" "pending" "done" "done"
write_index_row "$root2/backlog/index.md" "PB-TEST" "in-progress" "Quality Engineer, Security Engineer" "Awaiting QE and SE gates before review" "./items/PB-TEST.md"
expect_failure "drift in next eligible role fails" env PREFLIGHT_ROOT="$root2" "$PREFLIGHT"

# Case 3: role filter with no match should fail.
root3="$tmp/case3"
mkrepo "$root3"
write_item "$root3/backlog/items/PB-TEST.md" "ready" "pending" "pending" "pending" "pending" "done" "done"
write_index_row "$root3/backlog/index.md" "PB-TEST" "ready" "Implementing Developer" 'Awaiting implementation start (`ready` -> `in-progress`)' "./items/PB-TEST.md"
expect_failure "role filter no-match fails" env PREFLIGHT_ROOT="$root3" "$PREFLIGHT" --role "Security Engineer"

echo "All preflight tests passed."
