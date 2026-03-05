#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GUARD_SRC="$SCRIPT_DIR/governance_guard.sh"

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

setup_repo() {
  local root="$1"
  mkdir -p "$root/scripts" "$root/backlog" "$root/docs/00-governance"
  cp "$GUARD_SRC" "$root/scripts/governance_guard.sh"
  chmod +x "$root/scripts/governance_guard.sh"

  cat > "$root/AGENTS.md" <<'EOF_AGENTS'
# AGENTS
EOF_AGENTS
  cat > "$root/prompt.txt" <<'EOF_PROMPT'
# PROMPT
EOF_PROMPT
  cat > "$root/backlog/README.md" <<'EOF_BACKLOG'
# BACKLOG
EOF_BACKLOG
  cat > "$root/docs/00-governance/runtime-contract.md" <<'EOF_RUNTIME'
# RUNTIME
EOF_RUNTIME
  cat > "$root/docs/00-governance/policy-changelog.md" <<'EOF_CHANGELOG'
# CHANGELOG
EOF_CHANGELOG

  (
    cd "$root"
    git init -q
    git config user.email "test@example.com"
    git config user.name "Guard Test"
    git add .
    git commit -qm "init"
  )
}

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

# Case 1: no changes -> success.
repo1="$tmp/repo1"
setup_repo "$repo1"
expect_success "no-change state passes" bash -lc "cd '$repo1' && ./scripts/governance_guard.sh >/dev/null"

# Case 2: canonical changed without runtime/changelog -> failure.
repo2="$tmp/repo2"
setup_repo "$repo2"
echo "update" >> "$repo2/AGENTS.md"
expect_failure "canonical-only change fails" bash -lc "cd '$repo2' && ./scripts/governance_guard.sh >/dev/null"

# Case 3: canonical + changelog but missing runtime-contract -> failure.
repo3="$tmp/repo3"
setup_repo "$repo3"
echo "update" >> "$repo3/AGENTS.md"
echo "entry" >> "$repo3/docs/00-governance/policy-changelog.md"
expect_failure "canonical+changelog without runtime fails" bash -lc "cd '$repo3' && ./scripts/governance_guard.sh >/dev/null"

# Case 4: canonical + runtime + changelog -> success.
repo4="$tmp/repo4"
setup_repo "$repo4"
echo "update" >> "$repo4/AGENTS.md"
echo "sync" >> "$repo4/docs/00-governance/runtime-contract.md"
echo "entry" >> "$repo4/docs/00-governance/policy-changelog.md"
expect_success "canonical+runtime+changelog passes" bash -lc "cd '$repo4' && ./scripts/governance_guard.sh >/dev/null"

# Case 5: runtime changed without changelog -> failure.
repo5="$tmp/repo5"
setup_repo "$repo5"
echo "update" >> "$repo5/docs/00-governance/runtime-contract.md"
expect_failure "runtime-only without changelog fails" bash -lc "cd '$repo5' && ./scripts/governance_guard.sh >/dev/null"

# Case 6: runtime + changelog -> success.
repo6="$tmp/repo6"
setup_repo "$repo6"
echo "update" >> "$repo6/docs/00-governance/runtime-contract.md"
echo "entry" >> "$repo6/docs/00-governance/policy-changelog.md"
expect_success "runtime+changelog passes" bash -lc "cd '$repo6' && ./scripts/governance_guard.sh >/dev/null"

# Case 7: non-policy file with spaces should not break parser -> success.
repo7="$tmp/repo7"
setup_repo "$repo7"
mkdir -p "$repo7/misc"
echo "x" > "$repo7/misc/file with spaces.txt"
expect_success "space-path change is parsed safely" bash -lc "cd '$repo7' && ./scripts/governance_guard.sh >/dev/null"

echo "All governance guard tests passed."
