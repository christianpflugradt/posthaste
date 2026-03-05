# PB-0018: Local NLP intent/topic extraction foundation

## Source
- Product direction update (2026-03-05): move MVP forward with local NLP-based understanding.
- Intake brief: `docs/01-product/intake/PB-0018-nlp-intent-topic-extraction.md`.

## Parent Link
- PB-0001

## Problem Statement
Keyword-heavy matching is insufficient for target relevance quality; MVP needs local intent/topic signals.

## Desired Outcome
A local NLP extraction foundation provides intent/topic features for ranking.

## Vision Alignment
- High.

## Priority
- P1.

## Story Points
- 5

## Status
- shaped.

## Role Gate Matrix
| Role | State | Updated | Notes |
| --- | --- | --- | --- |
| Product Owner | done | 2026-03-05 | Intake framing and RE handoff completed. |
| Architect | pending | 2026-03-05 | Not started. |
| Requirements Engineer | done | 2026-03-05 | Requirements package completed in RFC-0018 with FR/NFR, assumptions, AC mapping, and traceability notes. |
| Quality Engineer | pending | 2026-03-05 | Not started. |
| Security Engineer | pending | 2026-03-05 | Not started. |
| Implementing Developer | pending | 2026-03-05 | Not started. |
| Reviewing Developer | pending | 2026-03-05 | Not started. |

## Constraints
- Time: parent scope expected to split during RE refinement.
- Cost: no paid core tooling/services.
- Technical: offline-first/local execution required.

## Recommendation
- Proceed.

## Acceptance Signal
- Stakeholder sees measurable relevance improvement from local intent/topic extraction slices.

## Handoff Target
- Product Owner -> Requirements Engineer + Architect.

## Blocking Conditions
- Requires RE refinement/split before `ready` if item exceeds `5 SP` scope boundary.

## Issue Comment Log
| Time | Role | Type | Note | Status Impact |
| --- | --- | --- | --- | --- |
| 2026-03-05 19:10 | Product Owner | status | Created PB-0018 as NLP-forward MVP parent story. | Product Owner: in-progress |
| 2026-03-05 19:10 | Product Owner | status | Completed intake framing and moved PB-0018 from `intake` to `shaped`. | Product Owner: done; item status: shaped |
| 2026-03-05 19:10 | Product Owner | handoff | Handoff package ready for RE refinement and possible story split. | None |
| 2026-03-05 19:19 | Requirements Engineer | status | Picked up PB-0018 refinement and transitioned role gate from `pending` to `in-progress` to define NLP extraction requirements and integration boundaries. | Requirements Engineer: in-progress |
| 2026-03-05 19:19 | Requirements Engineer | decision | Resolved intake questions with minimal assumptions: first increment is heuristic-first and domain-specific intent classes are deferred beyond initial increment. | None |
| 2026-03-05 19:19 | Requirements Engineer | status | Completed PB-0018 requirements package in `docs/03-engineering/rfcs/RFC-0018-pb-0018-nlp-intent-topic-extraction.md` with explicit scope, FR/NFR, assumptions, AC mapping, and traceability. | Requirements Engineer: done |
| 2026-03-05 19:19 | Requirements Engineer | blocker | Cannot transition PB-0018 to `ready` yet because Architect gate is still `pending`; item remains `shaped` pending Architect completion. | None |
