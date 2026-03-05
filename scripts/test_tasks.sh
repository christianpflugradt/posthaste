#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TASKS="$SCRIPT_DIR/tasks.sh"

expect_contains() {
  local label="$1"
  local haystack="$2"
  local needle="$3"
  if printf "%s" "$haystack" | grep -Fq "$needle"; then
    echo "PASS: $label"
  else
    echo "FAIL: $label (missing: $needle)"
    exit 1
  fi
}

expect_not_contains() {
  local label="$1"
  local haystack="$2"
  local needle="$3"
  if printf "%s" "$haystack" | grep -Fq "$needle"; then
    echo "FAIL: $label (unexpected: $needle)"
    exit 1
  else
    echo "PASS: $label"
  fi
}

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

mkdir -p "$tmp/backlog"
cat > "$tmp/backlog/index.md" <<'EOF_INDEX'
# Open Backlog Index

Only open items are listed here.

| ID | Title | Priority | Status | Role Owner | Next Eligible Role(s) | Blocker | Updated | Item |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| PB-0100 | Item A | P0 | in-progress | Implementing Developer | Security Engineer | Awaiting Security Engineer gate before review | 2026-03-05 | [PB-0100](./items/PB-0100.md) |
| PB-0101 | Item B | P0 | in-progress | Implementing Developer | Quality Engineer, Security Engineer | Awaiting QE and SE gates before review | 2026-03-05 | [PB-0101](./items/PB-0101.md) |
| PB-0102 | Item C | P1 | ready | Implementing Developer | Implementing Developer | Awaiting implementation start (`ready` -> `in-progress`) | 2026-03-05 | [PB-0102](./items/PB-0102.md) |
| PB-0103 | Item D | P2 | review | Reviewing Developer | Reviewing Developer | Awaiting stakeholder confirmation for `done` transition | 2026-03-05 | [PB-0103](./items/PB-0103.md) |
EOF_INDEX

out_all="$(TASKS_ROOT="$tmp" "$TASKS")"
expect_contains "all mode prints header" "$out_all" "Tasks (role: ALL, limit: 5)"
expect_contains "all mode includes first row" "$out_all" "1. PB-0100"
expect_contains "all mode includes fourth row" "$out_all" "4. PB-0103"

out_role="$(TASKS_ROOT="$tmp" "$TASKS" --role "Security Engineer" --limit 5)"
expect_contains "role mode prints header" "$out_role" "Tasks (role: Security Engineer, limit: 5)"
expect_contains "role mode includes first eligible" "$out_role" "1. PB-0100"
expect_contains "role mode includes second eligible" "$out_role" "2. PB-0101"
expect_not_contains "role mode excludes non-eligible" "$out_role" "PB-0102"

out_limit="$(TASKS_ROOT="$tmp" LIMIT=1 "$TASKS" --role "Security Engineer")"
expect_contains "limit mode includes first row" "$out_limit" "1. PB-0100"
expect_not_contains "limit mode excludes second row" "$out_limit" "2. PB-0101"

out_none="$(TASKS_ROOT="$tmp" "$TASKS" --role "Architect")"
expect_contains "no-match message" "$out_none" "No eligible tasks found for role 'Architect'."

echo "All tasks tests passed."
