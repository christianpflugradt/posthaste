#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT_DIR"

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Error: this directory is not a git repository."
  exit 1
fi

if [[ ! -f "commit-msg" ]]; then
  echo "Error: commit-msg file not found at repo root."
  exit 1
fi

if [[ -z "$(tr -d '[:space:]' < commit-msg)" ]]; then
  echo "Error: commit-msg is empty. Populate it before committing."
  exit 1
fi

git add -A

if git diff --cached --quiet; then
  echo "No staged changes to commit."
  exit 0
fi

git commit -F commit-msg
git push origin HEAD:main

echo "Committed and pushed to origin/main using commit-msg."
