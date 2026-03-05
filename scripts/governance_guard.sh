#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

declare -a CHANGED_FILES=()
while IFS= read -r -d '' rec; do
  status="${rec:0:2}"
  path="${rec:3}"

  # In -z mode, rename/copy records are followed by an extra NUL entry with the new path.
  if [[ "$status" =~ ^[RC] ]]; then
    IFS= read -r -d '' new_path || true
    if [[ -n "${new_path:-}" ]]; then
      CHANGED_FILES+=("$new_path")
    fi
  else
    CHANGED_FILES+=("$path")
  fi
done < <(git status --porcelain=v1 -z)

if [[ "${#CHANGED_FILES[@]}" -eq 0 ]]; then
  echo "OK: governance guard skipped (no working tree changes)."
  exit 0
fi

has_changed() {
  local target="$1"
  local f
  for f in "${CHANGED_FILES[@]}"; do
    if [[ "$f" == "$target" ]]; then
      return 0
    fi
  done
  return 1
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
    printf "%s\n" "${CHANGED_FILES[@]}"
    exit 1
  fi
fi

if [[ "$CANONICAL_CHANGED" -eq 1 && "$DERIVED_RUNTIME_CHANGED" -ne 1 ]]; then
  echo "FAIL: canonical governance files changed without runtime-contract sync."
  echo "Required file: docs/00-governance/runtime-contract.md"
  echo "Changed files:"
  printf "%s\n" "${CHANGED_FILES[@]}"
  exit 1
fi

echo "OK: governance guard checks passed."
