# Policy Changelog

Tracks governance/runtime policy deltas so agents can do lightweight refresh in active contexts.

## Usage Rules
- On every `go`, read this file plus `docs/00-governance/runtime-contract.md`.
- Re-read full governance docs (`AGENTS.md`, `backlog/README.md`, `prompt.txt`) only when:
  - this changelog contains entries newer than the agent's last-seen timestamp in the current session, or
  - stakeholder explicitly requests full re-read.
- Any work unit that changes policy must append one changelog entry.

## Entry Format
`YYYY-MM-DD HH:MM | scope | summary | files`

## Entries
2026-03-05 18:05 | runtime | Added compact runtime execution contract and references for startup/readability. | docs/00-governance/runtime-contract.md, AGENTS.md, prompt.txt, docs/README.md
2026-03-05 18:10 | pickup | Added deterministic preflight checks (`make preflight`) and required execution before pickup. | scripts/preflight.sh, Makefile, AGENTS.md, backlog/README.md, prompt.txt, README.md
2026-03-05 18:18 | refresh | Added delta-refresh policy: always read runtime contract + policy changelog on go; full governance re-read only on new changelog entries or explicit request. | docs/00-governance/policy-changelog.md, AGENTS.md, backlog/README.md, prompt.txt, docs/README.md, README.md
2026-03-05 18:26 | governance | Added canonical-vs-derived governance sync map and mandatory sync checklist for policy-changing work. | docs/00-governance/governance-sync-map.md, AGENTS.md, docs/README.md, docs/00-governance/policy-changelog.md
2026-03-05 18:31 | governance | Added automated governance guard (`make governance-guard`) enforcing changelog update when policy/runtime files change. | scripts/governance_guard.sh, Makefile, AGENTS.md, backlog/README.md, prompt.txt, docs/00-governance/policy-changelog.md
2026-03-05 18:38 | quality | Added regression tests for preflight consistency checker and required `make preflight-test` on pickup/preflight logic changes. | scripts/test_preflight.sh, scripts/preflight.sh, Makefile, AGENTS.md, docs/00-governance/policy-changelog.md
2026-03-05 18:48 | runtime | Restored missing active `go` rules in runtime contract (policy-changelog read, full-doc re-read trigger, and mandatory preflight command). | docs/00-governance/runtime-contract.md, docs/00-governance/policy-changelog.md
2026-03-05 18:50 | governance | Hardened governance guard to require runtime-contract sync whenever canonical governance files change. | scripts/governance_guard.sh, docs/00-governance/policy-changelog.md
2026-03-05 18:53 | governance | Made governance guard changed-file detection robust using `git status --porcelain=v1 -z` parsing to handle spaces/renames safely. | scripts/governance_guard.sh, docs/00-governance/policy-changelog.md
