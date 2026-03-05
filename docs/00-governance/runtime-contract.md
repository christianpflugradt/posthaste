# Runtime Contract

This is the compact operational contract for active execution (`go`) in existing contexts.
Use this as the first reference before working; full governance docs remain authoritative.

## Active Context Rules
- Keep the current role unless stakeholder explicitly switches roles.
- One work unit per prompt.
- On every `go`, re-read `backlog/index.md`.
- Select candidate by `Next Eligible Role(s)` in index order for the current role.
- Re-read selected issue file (`backlog/items/PB-*.md`) before acting.

## State and Sync Rules
- If you change issue gate/status, sync `backlog/index.md` row in the same work unit:
  - `Status`
  - `Next Eligible Role(s)`
  - `Blocker`
  - `Updated`
- Record role transitions and blockers in issue comment log.

## Completion Rules
- Complete role output end-to-end (including required checks/evidence).
- Update `commit-msg` only after work unit completion.
- Commit message must follow conventional format and include `Role: <Role Name>` trailer.
- Run `./commit.sh` at work unit completion.

## Escalation Rules
- If boundary/requirements are unclear, consult stakeholder before proceeding.
- If blockers exist and your role can unblock, prioritize unblocking.
- For non-trivial changes (architecture/cross-cutting/multi-role uncertainty), maintain OpenSpec package under `openspec/changes/`.

## Efficiency Rules
- Prefer local skills for repeated workflows:
  - `skills/pickup-preflight/SKILL.md`
  - `skills/index-sync/SKILL.md`
  - `skills/openspec-change-bootstrap/SKILL.md`
