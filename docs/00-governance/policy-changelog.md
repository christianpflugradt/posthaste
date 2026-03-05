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
