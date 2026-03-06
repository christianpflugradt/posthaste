# Runtime Contract

This is the compact operational contract for active execution (`go`, `go all`) in existing contexts.
Use this as the first reference before working; full governance docs remain authoritative.
If wording conflicts with canonical governance sources (`AGENTS.md`, `backlog/README.md`, `prompt.txt`), canonical sources win.

## Active Context Rules
- Keep the current role unless stakeholder explicitly switches roles.
- One work unit per prompt, except `go all` which executes multiple single-unit iterations in one continuous run.
- `go`: execute one eligible work unit for the current role.
- `go all`: execute a loop of `go` work units for the current role.
- On every `go` and every `go all` iteration, read `docs/00-governance/runtime-contract.md` and `docs/00-governance/policy-changelog.md`.
- If policy-changelog has entries newer than your session last-seen, re-read full governance docs (`AGENTS.md`, `backlog/README.md`, `prompt.txt`).
- On every `go` and every `go all` iteration, re-read `backlog/index.md`.
- On every `go` and every `go all` iteration, run `make preflight ROLE="<Current Role>"`.
- Select candidate by `Next Eligible Role(s)` in index order for the current role.
- Re-read selected issue file (`backlog/items/PB-*.md`) before acting.
- `go all` stop conditions: no eligible work, hard blocker requiring stakeholder input, or failing required checks.

## State and Sync Rules
- If you change issue gate/status, sync `backlog/index.md` row in the same work unit:
  - `Status`
  - `Next Eligible Role(s)`
  - `Blocker`
  - `Updated`
- If Quality Engineer or Security Engineer sets a gate to `done` or `blocked`, run `PB=<PB-ID> make index-sync` and `make preflight ROLE="<Current Role>"` before completing the work unit.
- Record role transitions and blockers in issue comment log.

## Completion Rules
- Complete role output end-to-end (including required checks/evidence).
- Update `commit-msg` only after work unit completion.
- Commit message must follow conventional format and include `Role: <Role Name>` trailer.
- Run `./commit.sh` at work unit completion.
- In `go all`, each iteration must fully complete and auto-commit before next iteration.

## Escalation Rules
- If boundary/requirements are unclear, consult stakeholder before proceeding.
- If blockers exist and your role can unblock, prioritize unblocking.
- For non-trivial changes (architecture/cross-cutting/multi-role uncertainty), maintain OpenSpec package under `openspec/changes/`.

## Efficiency Rules
- Prefer local skills for repeated workflows:
  - `skills/pickup-preflight/SKILL.md`
  - `skills/index-sync/SKILL.md`
  - `skills/openspec-change-bootstrap/SKILL.md`
- For deterministic backlog listing, run `make tasks ROLE="<Current Role>"`.
- For one-command active pre-check, run `make go-ready ROLE="<Current Role>"`.
- For one-command loop pre-check, run `make go-all-ready ROLE="<Current Role>"`.
