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
| Requirements Engineer | 2026-03-05 | 2026-03-05 | Completed ambiguity/acceptance-criteria quality pass and traceability consistency review across open backlog; no contradictions, and readiness blockers remain explicitly tracked per-item pending RE refinement. |
| Quality Engineer | 2026-03-05 | 2026-03-05 | Completed regular flaky-signal audit and deep gate-effectiveness review: no code/test artifacts exist yet, quality docs/templates are aligned, and implementation-phase evidence requirements remain explicit. |
| Security Engineer | 2026-03-05 | 2026-03-05 | Completed regular dependency/security posture review and deep control-coverage/residual-risk trend review; no code or dependencies exist yet, baseline controls and policies remain aligned, and no immediate hardening backlog item is required. |
| Implementing Developer | TBD | TBD |  |
| Reviewing Developer | TBD | TBD |  |

## Update Rule
After completing a proactive review, update the relevant timestamp(s) in this file and add a short note in the active issue comment log or a dedicated proactive-review backlog item.
