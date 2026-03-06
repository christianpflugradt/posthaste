# PB-0022: NLP viability gate versus 30-second manual baseline

## Source
- Product direction update (2026-03-05): run explicit go/no-go viability gate before further roadmap expansion.
- Intake brief: `docs/01-product/intake/PB-0022-local-evaluation-expansion.md`.

## Parent Link
- PB-0001

## Problem Statement
If pure NLP output quality does not beat stakeholder 30-second manual tagging, product premise is not viable.

## Desired Outcome
Deterministic benchmark evidence enables explicit continue/stop decision on product direction.

## Vision Alignment
- High.

## Priority
- P0.

## Story Points
- 5

## Status
- shaped.

## Role Gate Matrix
| Role | State | Updated | Notes |
| --- | --- | --- | --- |
| Product Owner | done | 2026-03-05 | Intake framing and RE handoff completed. |
| Architect | pending | 2026-03-05 | Not started. |
| Requirements Engineer | done | 2026-03-05 | Requirements package completed in RFC-0022 with FR/NFR, assumptions, AC mapping, and traceability notes. |
| Quality Engineer | pending | 2026-03-05 | Not started. |
| Security Engineer | pending | 2026-03-05 | Not started. |
| Implementing Developer | pending | 2026-03-05 | Not started. |
| Reviewing Developer | pending | 2026-03-05 | Not started. |

## Constraints
- Time: parent scope expected to split during RE refinement.
- Cost: no paid core tooling/services.
- Technical: evaluate pure local NLP quality without LinkedIn API/scraping assumptions.

## Recommendation
- Proceed.

## Acceptance Signal
- Stakeholder has clear benchmark result versus 30-second baseline and can issue explicit go/no-go decision.

## Handoff Target
- Product Owner -> Requirements Engineer + Architect.

## Blocking Conditions
- Requires RE refinement/split before `ready` if item exceeds `5 SP` scope boundary.

## Issue Comment Log
| Time | Role | Type | Note | Status Impact |
| --- | --- | --- | --- | --- |
| 2026-03-05 19:10 | Product Owner | status | Created PB-0022 as local-evaluation growth parent story. | Product Owner: in-progress |
| 2026-03-05 19:10 | Product Owner | status | Completed intake framing and moved PB-0022 from `intake` to `shaped`. | Product Owner: done; item status: shaped |
| 2026-03-05 19:10 | Product Owner | handoff | Handoff package ready for RE refinement and possible story split. | None |
| 2026-03-05 19:42 | Requirements Engineer | status | Picked up PB-0022 refinement and transitioned role gate from `pending` to `in-progress` to define fixture-category expansion and threshold-policy requirements. | Requirements Engineer: in-progress |
| 2026-03-05 19:42 | Requirements Engineer | decision | Resolved intake questions with minimal assumptions: initial expansion targets 4 additional fixture categories, and thresholds are enforced both per-category and aggregate. | None |
| 2026-03-05 19:42 | Requirements Engineer | status | Completed PB-0022 requirements package in `docs/03-engineering/rfcs/RFC-0022-pb-0022-local-evaluation-expansion.md` with explicit scope, FR/NFR, assumptions, AC mapping, and traceability. | Requirements Engineer: done |
| 2026-03-05 19:42 | Requirements Engineer | blocker | Cannot transition PB-0022 to `ready` yet because Architect gate is still `pending`; item remains `shaped` pending Architect completion. | None |
| 2026-03-06 19:06 | Product Owner | decision | Scope reset per DEC-0004: repurposed PB-0022 as hard NLP viability gate against stakeholder 30-second manual baseline and raised priority to `P0`. | item priority/scope updated |
