# PB-0012: Security hardening by pinning GitHub Actions to commit SHAs

## Source
- Product Owner follow-up (2026-03-05): reduce CI/release supply-chain risk by pinning action references to immutable SHAs.
- Intake brief: `docs/01-product/intake/PB-0012-actions-sha-pinning-security-hardening.md`.

## Parent Link
- None

## Problem Statement
Current workflow action references use moving tags, leaving CI/release behavior exposed to upstream action drift.

## Desired Outcome
All in-scope workflow actions are pinned to immutable SHAs with a clear update policy.

## Vision Alignment
- High.

## Priority
- P1.

## Story Points
- 2

## Status
- ready.

## Role Gate Matrix
| Role | State | Updated | Notes |
| --- | --- | --- | --- |
| Product Owner | done | 2026-03-05 | Intake framing and RE handoff completed. |
| Architect | done | 2026-03-05 | SHA-pinning architecture policy finalized (ADR-011) with RFC + implementation-plan handoff artifacts. |
| Requirements Engineer | done | 2026-03-05 | Requirements package completed in RFC-0012 with FR/NFR, assumptions, AC mapping, and traceability notes. |
| Quality Engineer | pending | 2026-03-05 | Not started. |
| Security Engineer | pending | 2026-03-05 | Not started. |
| Implementing Developer | pending | 2026-03-05 | Not started. |
| Reviewing Developer | pending | 2026-03-05 | Not started. |

## Constraints
- Preserve current workflow behavior.
- No paid tooling dependency for pin management.
- Keep updates maintainable.

## Recommendation
- Proceed.

## Acceptance Signal
- Actions are SHA-pinned and workflows still pass.

## Handoff Target
- Product Owner -> Requirements Engineer + Architect.

## Blocking Conditions
- Requires Architect gate completion before Requirements Engineer can transition item to `ready`.

## Issue Comment Log
| Time | Role | Type | Note | Status Impact |
| --- | --- | --- | --- | --- |
| 2026-03-05 19:04 | Product Owner | status | Created PB-0012 from hardening backlog planning after baseline delivery. | Product Owner: in-progress |
| 2026-03-05 19:04 | Product Owner | status | Completed intake framing and moved PB-0012 from `intake` to `shaped`. | Product Owner: done; item status: shaped |
| 2026-03-05 19:04 | Product Owner | handoff | Handoff package ready for RE refinement on action-pin scope and update policy. | None |
| 2026-03-05 19:15 | Requirements Engineer | status | Picked up PB-0012 refinement and transitioned role gate from `pending` to `in-progress` for pinning scope/update-policy requirement definition. | Requirements Engineer: in-progress |
| 2026-03-05 19:15 | Requirements Engineer | decision | Resolved intake questions with minimal assumptions: monthly pin refresh cadence by default, and pin-refresh automation handled as separate follow-up backlog item. | None |
| 2026-03-05 19:15 | Requirements Engineer | status | Completed PB-0012 requirements package in `docs/03-engineering/rfcs/RFC-0012-pb-0012-actions-sha-pinning-security-hardening.md` with explicit scope, FR/NFR, AC mapping, and traceability. | Requirements Engineer: done |
| 2026-03-05 19:15 | Requirements Engineer | blocker | Cannot transition PB-0012 to `ready` yet because Architect gate is still `pending`; item remains `shaped` pending Architect completion. | None |
| 2026-03-05 21:02 | Architect | status | Picked up PB-0012 Architect work unit and transitioned role gate from `pending` to `in-progress` for action pinning architecture finalization. | Architect: in-progress |
| 2026-03-05 21:02 | Architect | decision | Recorded SHA-pinning architecture policy in `docs/03-engineering/decision-records/ADR-011-github-actions-sha-pinning-policy.md` including immutable reference requirements, refresh cadence, and revisit triggers. | None |
| 2026-03-05 21:02 | Architect | handoff | Published architect artifacts for implementation handoff: `docs/03-engineering/rfcs/RFC-0012-pb-0012-actions-sha-pinning-security-hardening.md` (constraints/interface assumptions) and `docs/03-engineering/implementation-plans/PLAN-0012-pb-0012-actions-sha-pinning-security-hardening.md` (task/risk/verification breakdown). | None |
| 2026-03-05 21:02 | Architect | status | Architect gate complete for PB-0012 with no unresolved architecture ambiguity; Requirements Engineer can transition item to `ready` per ownership rules. | Architect: done |
| 2026-03-05 21:03 | Requirements Engineer | status | Confirmed Architect + Requirements Engineer gates are both `done`; resolved prior RE blocker and transitioned PB-0012 from `shaped` to `ready`. | item status: ready |
