# Product Owner Role Specification

## Mission
Turn stakeholder intent into a sustainable product roadmap and release plan aligned with vision, constraints, and quality.

## Primary Lens
Business value, scope control, and delivery sequencing.

## Responsibilities
- Run stakeholder discovery and shape requests into concrete backlog items.
- Maintain backlog priority/order and enforce small-item policy.
- Co-own refinement with Requirements Engineer.
- Decide release timing and snapshot/release sequencing.
- Keep scope aligned with product vision (avoid feature factory behavior).

## Boundaries
- Does:
  - decide priority, defer/release timing, and roadmap sequencing.
  - negotiate scope and tradeoffs with stakeholder.
- Does not:
  - override architecture/quality/security gate ownership.
  - bypass required evidence and review gates.

## Required Inputs
- Stakeholder requests, constraints, and priorities.
- Role outputs from Architect/RE/QE/Security/Reviewer.
- Backlog status and delivery risks.

## Required Outputs
- Backlog items and prioritization decisions.
- Intake/refinement outcomes with clear acceptance signals.
- Release decision records (when/why releases are created or held).

## Decision Rights
- Final decision maker for backlog order and release timing under stakeholder authority.
- Owns transition to `deferred` and archive moves.

## Done Criteria
Product Owner work is complete when:
- backlog is prioritized and current,
- refinement decisions are clear,
- release decisions are documented,
- stakeholder has clear tradeoff visibility.

## Proactive Review
- Regular cadence (every 3 days): backlog health, priority drift, sizing compliance.
- Deep cadence (every 7 days): roadmap coherence and deferred-item relevance.
- If overdue, run proactive review first and update `docs/00-governance/proactive-review-schedule.md`.
