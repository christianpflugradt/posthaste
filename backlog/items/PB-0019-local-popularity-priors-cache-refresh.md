# PB-0019: Local popularity priors curation and cache refresh (no API/scraping)

## Source
- Product direction update (2026-03-05): incorporate popularity priors without LinkedIn API/scraping dependency.
- Intake brief: `docs/01-product/intake/PB-0019-local-popularity-priors-cache-refresh.md`.

## Parent Link
- PB-0001

## Problem Statement
Ranking quality benefits from popularity priors, but product scope cannot rely on unverified LinkedIn API access or scraping.

## Desired Outcome
A compliant local popularity-prior data flow with cache/refresh policy supports ranking without policy-risky collection methods.

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
| Requirements Engineer | done | 2026-03-05 | Requirements package completed in RFC-0019 with FR/NFR, assumptions, AC mapping, and traceability notes. |
| Quality Engineer | pending | 2026-03-05 | Not started. |
| Security Engineer | pending | 2026-03-05 | Not started. |
| Implementing Developer | pending | 2026-03-05 | Not started. |
| Reviewing Developer | pending | 2026-03-05 | Not started. |

## Constraints
- Time: parent scope expected to split during RE refinement.
- Cost: no paid core tooling/services.
- Technical: no scraping and no hard dependency on unavailable/unsupported LinkedIn API endpoints.

## Recommendation
- Proceed.

## Acceptance Signal
- Stakeholder confirms curated popularity priors improve ordering quality versus pure relevance-only baseline.

## Handoff Target
- Product Owner -> Requirements Engineer + Architect.

## Blocking Conditions
- Requires RE refinement/split before `ready` if item exceeds `5 SP` scope boundary.

## Issue Comment Log
| Time | Role | Type | Note | Status Impact |
| --- | --- | --- | --- | --- |
| 2026-03-05 19:10 | Product Owner | status | Created PB-0019 as popularity-signal MVP parent story. | Product Owner: in-progress |
| 2026-03-05 19:10 | Product Owner | status | Completed intake framing and moved PB-0019 from `intake` to `shaped`. | Product Owner: done; item status: shaped |
| 2026-03-05 19:10 | Product Owner | handoff | Handoff package ready for RE refinement and possible story split. | None |
| 2026-03-05 19:23 | Requirements Engineer | status | Picked up PB-0019 refinement and transitioned role gate from `pending` to `in-progress` to define ingestion/cache requirements and fallback behavior. | Requirements Engineer: in-progress |
| 2026-03-05 19:23 | Requirements Engineer | decision | Resolved intake questions with minimal assumptions: MVP cache freshness target is 24 hours and ingestion trigger model is hybrid (scheduled + manual). | None |
| 2026-03-05 19:23 | Requirements Engineer | status | Completed PB-0019 requirements package in `docs/03-engineering/rfcs/RFC-0019-pb-0019-linkedin-popularity-ingestion-local-cache.md` with explicit scope, FR/NFR, assumptions, AC mapping, and traceability. | Requirements Engineer: done |
| 2026-03-05 19:23 | Requirements Engineer | blocker | Cannot transition PB-0019 to `ready` yet because Architect gate is still `pending`; item remains `shaped` pending Architect completion. | None |
| 2026-03-06 19:06 | Product Owner | decision | Scope reset per DEC-0004: removed LinkedIn API/scraping dependency from PB-0019 and reframed as compliant local popularity-prior curation/cache work. Priority adjusted to `P2`. | item priority/scope updated |
