#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

CHANGED="$(git status --porcelain | awk '{print $2}')"

if [[ -z "${CHANGED}" ]]; then
  echo "OK: governance guard skipped (no working tree changes)."
  exit 0
fi

has_changed() {
  local target="$1"
  printf "%s\n" "$CHANGED" | grep -Fxq "$target"
}

CANONICAL_CHANGED=0
for f in "AGENTS.md" "backlog/README.md" "prompt.txt"; do
  if has_changed "$f"; then
    CANONICAL_CHANGED=1
  fi
done

DERIVED_RUNTIME_CHANGED=0
if has_changed "docs/00-governance/runtime-contract.md"; then
  DERIVED_RUNTIME_CHANGED=1
fi

CHANGELOG_CHANGED=0
if has_changed "docs/00-governance/policy-changelog.md"; then
  CHANGELOG_CHANGED=1
fi

if [[ "$CANONICAL_CHANGED" -eq 1 || "$DERIVED_RUNTIME_CHANGED" -eq 1 ]]; then
  if [[ "$CHANGELOG_CHANGED" -ne 1 ]]; then
    echo "FAIL: policy/governance files changed without changelog update."
    echo "Required file: docs/00-governance/policy-changelog.md"
    echo "Changed files:"
    printf "%s\n" "$CHANGED"
    exit 1
  fi
fi

if [[ "$CANONICAL_CHANGED" -eq 1 && "$DERIVED_RUNTIME_CHANGED" -ne 1 ]]; then
  echo "FAIL: canonical governance files changed without runtime-contract sync."
  echo "Required file: docs/00-governance/runtime-contract.md"
  echo "Changed files:"
  printf "%s\n" "$CHANGED"
  exit 1
fi

echo "OK: governance guard checks passed."
