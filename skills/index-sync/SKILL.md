# Skill: Index Sync

Use whenever you changed gate/status in `backlog/items/PB-*.md`.

## Required Sync Fields in `backlog/index.md`
- `Status`
- `Next Eligible Role(s)`
- `Blocker`
- `Updated`

## Steps
1. Read latest role gate matrix in issue file.
2. Derive next eligibility:
   - `ready` with implementation pending -> `Implementing Developer`.
   - `in-progress` with QE/SE pending -> both listed.
   - `in-progress` with QE+SE done and review pending -> `Reviewing Developer`.
   - blocked condition -> list role(s) capable of unblocking, and set blocker text.
3. Update matching row in `backlog/index.md`.
4. Verify no contradiction between index row and issue role gates.

## Output
- A synced index row with explicit eligibility and blocker state.
