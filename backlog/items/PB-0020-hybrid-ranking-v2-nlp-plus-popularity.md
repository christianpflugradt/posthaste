# PB-0020: Hybrid ranking v2 (NLP relevance + local curated popularity priors)

## Source
- Product direction update (2026-03-05): implement target MVP ranking approach combining NLP and compliant local popularity priors.
- Intake brief: `docs/01-product/intake/PB-0020-hybrid-ranking-v2-nlp-plus-popularity.md`.

## Parent Link
- PB-0001

## Problem Statement
Current ranking does not yet realize planned hybrid v2 behavior across NLP and compliant local popularity priors.

## Desired Outcome
Hybrid ranking v2 produces improved ordered hashtags with measurable quality gain on local fixtures without API/scraping dependency.

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
| Requirements Engineer | done | 2026-03-05 | Requirements package completed in RFC-0020 with FR/NFR, assumptions, AC mapping, and traceability notes. |
| Quality Engineer | pending | 2026-03-05 | Not started. |
| Security Engineer | pending | 2026-03-05 | Not started. |
| Implementing Developer | pending | 2026-03-05 | Not started. |
| Reviewing Developer | pending | 2026-03-05 | Not started. |

## Constraints
- Time: parent scope expected to split during RE refinement.
- Cost: no paid core tooling/services.
- Technical: preserve deterministic local behavior and avoid LinkedIn API/scraping dependency assumptions.

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
| 2026-03-05 19:24 | Requirements Engineer | status | Picked up PB-0020 refinement and transitioned role gate from `pending` to `in-progress` to define hybrid score contract and rollout evidence thresholds. | Requirements Engineer: in-progress |
| 2026-03-05 19:24 | Requirements Engineer | decision | Resolved intake questions with minimal assumptions: first increment uses fixed weighting (no configurability), and rollout gate requires at least +10% measured lift on local fixture composite metric. | None |
| 2026-03-05 19:24 | Requirements Engineer | status | Completed PB-0020 requirements package in `docs/03-engineering/rfcs/RFC-0020-pb-0020-hybrid-ranking-v2-nlp-plus-popularity.md` with explicit scope, FR/NFR, assumptions, AC mapping, and traceability. | Requirements Engineer: done |
| 2026-03-05 19:24 | Requirements Engineer | blocker | Cannot transition PB-0020 to `ready` yet because Architect gate is still `pending`; item remains `shaped` pending Architect completion. | None |
| 2026-03-06 19:06 | Product Owner | decision | Scope reset per DEC-0004: clarified PB-0020 hybrid model uses local NLP + curated popularity priors only (no LinkedIn API/scraping dependency). | item scope updated |
