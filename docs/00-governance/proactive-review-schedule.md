# Proactive Review Schedule

This file tracks proactive role reviews.

## Cadence Rules
- Regular review due every 3 days.
- Deep review due every 7 days.
- If overdue, proactive review is the first work unit for that role.

## Scope by Role
- Product Owner
  - Regular (3d): backlog health, priority drift, item sizing compliance.
  - Deep (7d): roadmap coherence and deferred-item relevance review.
- Architect
  - Regular (3d): ADR drift check on active/open items.
  - Deep (7d): architecture consistency and coupling risk review.
- Requirements Engineer
  - Regular (3d): ambiguity and acceptance-criteria quality pass.
  - Deep (7d): traceability and requirement-pattern consistency review.
- Quality Engineer
  - Regular (3d): code/test quality consistency and flaky signal audit.
  - Deep (7d): quality debt and gate effectiveness review.
- Security Engineer
  - Regular (3d): dependency/security posture review.
  - Deep (7d): control coverage and residual-risk trend review.
- Implementing Developer
  - Regular (3d): implementation consistency and maintainability scan.
  - Deep (7d): technical-debt and duplication hotspot review.
- Reviewing Developer
  - Regular (3d): finding-pattern and severity consistency review.
  - Deep (7d): review rubric calibration and follow-up aging review.

## Tracking Table
| Role | Regular Last Done | Deep Last Done | Notes |
| --- | --- | --- | --- |
| Product Owner | 2026-03-05 | 2026-03-05 | Completed backlog health + roadmap coherence proactive review; no priority/sizing/deferred drift found. |
| Architect | 2026-03-05 | 2026-03-05 | Completed ADR drift check and architecture consistency/coupling review across open backlog items; no drift or new coupling risks found. |
| Requirements Engineer | TBD | TBD |  |
| Quality Engineer | TBD | TBD |  |
| Security Engineer | TBD | TBD |  |
| Implementing Developer | TBD | TBD |  |
| Reviewing Developer | TBD | TBD |  |

## Update Rule
After completing a proactive review, update the relevant timestamp(s) in this file and add a short note in the active issue comment log or a dedicated proactive-review backlog item.
