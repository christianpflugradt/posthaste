# PB-0023: CLI practical usage modes and output context improvements

## Source
- Product direction update (2026-03-05): improve practical local daily usage patterns for MVP CLI.
- Intake brief: `docs/01-product/intake/PB-0023-cli-practical-usage-modes.md`.

## Parent Link
- PB-0001

## Problem Statement
Current CLI flow lacks some practical usage modes/context for efficient repeated workflows.

## Desired Outcome
CLI provides practical invocation/output modes that speed real day-to-day usage.

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
| Requirements Engineer | done | 2026-03-05 | Requirements package completed in RFC-0023 with FR/NFR, assumptions, AC mapping, and traceability notes. |
| Quality Engineer | pending | 2026-03-05 | Not started. |
| Security Engineer | pending | 2026-03-05 | Not started. |
| Implementing Developer | pending | 2026-03-05 | Not started. |
| Reviewing Developer | pending | 2026-03-05 | Not started. |

## Constraints
- Time: parent scope expected to split during RE refinement.
- Cost: no paid core tooling/services.
- Technical: preserve backward-compatible baseline invocation.

## Recommendation
- Proceed.

## Acceptance Signal
- Stakeholder confirms faster and clearer local CLI usage in regular drafting workflow.

## Handoff Target
- Product Owner -> Requirements Engineer + Architect.

## Blocking Conditions
- Requires RE refinement/split before `ready` if item exceeds `5 SP` scope boundary.

## Issue Comment Log
| Time | Role | Type | Note | Status Impact |
| --- | --- | --- | --- | --- |
| 2026-03-05 19:10 | Product Owner | status | Created PB-0023 as practical CLI usage parent story. | Product Owner: in-progress |
| 2026-03-05 19:10 | Product Owner | status | Completed intake framing and moved PB-0023 from `intake` to `shaped`. | Product Owner: done; item status: shaped |
| 2026-03-05 19:10 | Product Owner | handoff | Handoff package ready for RE refinement and possible story split. | None |
| 2026-03-05 19:45 | Requirements Engineer | status | Picked up PB-0023 refinement and transitioned role gate from `pending` to `in-progress` to define practical CLI mode priorities and output-context contract. | Requirements Engineer: in-progress |
| 2026-03-05 19:45 | Requirements Engineer | decision | Resolved intake questions with minimal assumptions: prioritize stdin + verbosity controls first (batch deferred), and include explanation/confidence annotations as optional output in this phase. | None |
| 2026-03-05 19:45 | Requirements Engineer | status | Completed PB-0023 requirements package in `docs/03-engineering/rfcs/RFC-0023-pb-0023-cli-practical-usage-modes.md` with explicit scope, FR/NFR, assumptions, AC mapping, and traceability. | Requirements Engineer: done |
| 2026-03-05 19:45 | Requirements Engineer | blocker | Cannot transition PB-0023 to `ready` yet because Architect gate is still `pending`; item remains `shaped` pending Architect completion. | None |
