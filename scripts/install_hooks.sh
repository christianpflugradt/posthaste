#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
HOOK_SRC="$ROOT/.githooks/pre-commit"
HOOK_DST="$ROOT/.git/hooks/pre-commit"

if [[ ! -f "$HOOK_SRC" ]]; then
  echo "ERROR: missing hook source at $HOOK_SRC" >&2
  exit 1
fi

cp "$HOOK_SRC" "$HOOK_DST"
chmod +x "$HOOK_DST"

echo "Installed pre-commit hook at $HOOK_DST"
