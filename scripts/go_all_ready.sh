#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ROLE="${ROLE:-}"

if [[ -z "$ROLE" ]]; then
  echo "ERROR: ROLE is required. Example: make go-all-ready ROLE=\"Security Engineer\"" >&2
  exit 1
fi

echo "go-all-ready: role=$ROLE"
echo "go-all-ready: validating runtime references"
test -f "$ROOT/docs/00-governance/runtime-contract.md"
test -f "$ROOT/docs/00-governance/policy-changelog.md"

echo "go-all-ready: running preflight"
make -C "$ROOT" preflight ROLE="$ROLE"

echo "go-all-ready: running governance guard"
make -C "$ROOT" governance-guard

echo "go-all-ready: showing deterministic top-5 tasks"
make -C "$ROOT" tasks ROLE="$ROLE" LIMIT=5

echo "OK: go-all-ready checks passed."
