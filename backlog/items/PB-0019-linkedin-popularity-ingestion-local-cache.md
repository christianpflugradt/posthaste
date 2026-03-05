# PB-0019: LinkedIn hashtag popularity ingestion with local cache

## Source
- Product direction update (2026-03-05): incorporate LinkedIn popularity signal into MVP ranking path.
- Intake brief: `docs/01-product/intake/PB-0019-linkedin-popularity-ingestion-local-cache.md`.

## Parent Link
- PB-0001

## Problem Statement
Static priors alone can drift from real hashtag usage; MVP needs fresher popularity inputs.

## Desired Outcome
Popularity ingestion plus local cache provides practical, resilient popularity signal for ranking.

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
- Technical: maintain useful offline behavior via cache/fallback.

## Recommendation
- Proceed.

## Acceptance Signal
- Stakeholder confirms popularity-informed ordering behaves closer to expected LinkedIn usage.

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
