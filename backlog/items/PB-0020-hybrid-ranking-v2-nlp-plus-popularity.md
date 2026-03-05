# PB-0020: Hybrid ranking v2 (NLP relevance + popularity)

## Source
- Product direction update (2026-03-05): implement target MVP ranking approach combining NLP and popularity.
- Intake brief: `docs/01-product/intake/PB-0020-hybrid-ranking-v2-nlp-plus-popularity.md`.

## Parent Link
- PB-0001

## Problem Statement
Current ranking does not yet realize planned hybrid v2 behavior across NLP and popularity inputs.

## Desired Outcome
Hybrid ranking v2 produces improved ordered hashtags with measurable quality gain on local fixtures.

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
| Requirements Engineer | pending | 2026-03-05 | Must split into 1-5 SP implementation slices before `ready` if scope exceeds limit. |
| Quality Engineer | pending | 2026-03-05 | Not started. |
| Security Engineer | pending | 2026-03-05 | Not started. |
| Implementing Developer | pending | 2026-03-05 | Not started. |
| Reviewing Developer | pending | 2026-03-05 | Not started. |

## Constraints
- Time: parent scope expected to split during RE refinement.
- Cost: no paid core tooling/services.
- Technical: preserve deterministic local behavior and evaluation traceability.

## Recommendation
- Proceed.

## Acceptance Signal
- Stakeholder confirms v2 ordering quality improves on curated post set.

## Handoff Target
- Product Owner -> Requirements Engineer + Architect.

## Blocking Conditions
- Requires RE refinement/split before `ready` if item exceeds `5 SP` scope boundary.

## Issue Comment Log
| Time | Role | Type | Note | Status Impact |
| --- | --- | --- | --- | --- |
| 2026-03-05 19:10 | Product Owner | status | Created PB-0020 as hybrid-ranking MVP parent story. | Product Owner: in-progress |
| 2026-03-05 19:10 | Product Owner | status | Completed intake framing and moved PB-0020 from `intake` to `shaped`. | Product Owner: done; item status: shaped |
| 2026-03-05 19:10 | Product Owner | handoff | Handoff package ready for RE refinement and possible story split. | None |
