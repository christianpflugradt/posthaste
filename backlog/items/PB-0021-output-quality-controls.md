# PB-0021: Output quality controls (dedupe, diversity, generic suppression)

## Source
- Product direction update (2026-03-05): improve practical output quality guardrails for MVP usefulness.
- Intake brief: `docs/01-product/intake/PB-0021-output-quality-controls.md`.

## Parent Link
- PB-0001

## Problem Statement
Without explicit quality controls, outputs can include repetitive/generic tags that reduce practical value.

## Desired Outcome
Post-ranking controls improve output practicality while preserving relevant coverage.

## Vision Alignment
- High.

## Priority
- P2.

## Story Points
- 5

## Status
- shaped.

## Role Gate Matrix
| Role | State | Updated | Notes |
| --- | --- | --- | --- |
| Product Owner | done | 2026-03-05 | Intake framing and RE handoff completed. |
| Architect | pending | 2026-03-05 | Not started. |
| Requirements Engineer | pending | 2026-03-05 | Must split into 1-5 SP implementation slices before `ready` if scope exceeds limit. |
| Quality Engineer | pending | 2026-03-05 | Not started. |
| Security Engineer | pending | 2026-03-05 | Not started. |
| Implementing Developer | pending | 2026-03-05 | Not started. |
| Reviewing Developer | pending | 2026-03-05 | Not started. |

## Constraints
- Time: parent scope expected to split during RE refinement.
- Cost: no paid core tooling/services.
- Technical: maintain deterministic behavior.

## Recommendation
- Proceed.

## Acceptance Signal
- Stakeholder reports improved real-use output quality on curated drafts.

## Handoff Target
- Product Owner -> Requirements Engineer + Architect.

## Blocking Conditions
- Requires RE refinement/split before `ready` if item exceeds `5 SP` scope boundary.

## Issue Comment Log
| Time | Role | Type | Note | Status Impact |
| --- | --- | --- | --- | --- |
| 2026-03-05 19:10 | Product Owner | status | Created PB-0021 as output-quality guardrails parent story. | Product Owner: in-progress |
| 2026-03-05 19:10 | Product Owner | status | Completed intake framing and moved PB-0021 from `intake` to `shaped`. | Product Owner: done; item status: shaped |
| 2026-03-05 19:10 | Product Owner | handoff | Handoff package ready for RE refinement and possible story split. | None |
