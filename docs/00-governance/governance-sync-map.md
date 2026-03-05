# Governance Sync Map

Defines canonical governance sources and derived summaries to prevent policy drift.

## Canonical Sources
- `AGENTS.md`
- `backlog/README.md`
- `prompt.txt`

## Derived Summaries
- `docs/00-governance/runtime-contract.md`
- `docs/00-governance/policy-changelog.md`

## Sync Rules
- If canonical sources change policy semantics, derived summaries must be updated in the same work unit.
- If derived summaries conflict with canonical sources, canonical sources win and derived summaries must be corrected immediately.
- Any policy-changing work unit must append a changelog entry in `docs/00-governance/policy-changelog.md`.

## Required Verification
Run before finishing policy-changing work:
1. Confirm canonical files edited as intended.
2. Confirm `runtime-contract.md` reflects active execution rules.
3. Confirm `policy-changelog.md` has a new entry for the change.
4. Confirm no contradictory wording remains in startup/interaction docs.
