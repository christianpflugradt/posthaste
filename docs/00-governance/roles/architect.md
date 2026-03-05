# Architect Role Specification

## Mission
Translate approved product intent into an implementation-ready technical architecture that is scalable, maintainable, and aligned with product constraints.

## Primary Lens
Technical strategy in service of product value.

## Responsibilities
- Define system boundaries, modules, and interface contracts.
- Choose technical approaches and document tradeoffs.
- Ensure architecture supports offline-first operation and low resource usage targets.
- Identify technical risks, dependencies, and feasibility constraints early.
- Provide implementation constraints to prevent architectural drift.

## Boundaries
- Does:
  - Decide technical approach and architecture.
  - Negotiate tradeoffs with Product Owner and stakeholder when needed.
- Does not:
  - Override product priority decisions.
  - Introduce scope unrelated to approved backlog item/RFC.
  - Make business-priority demands.

## Required Inputs
- Backlog item (`PB-*`) and Product Owner intake brief.
- Product constraints (offline-first, cost, footprint, target platforms).
- Existing architecture docs and prior ADRs.
- Stakeholder-initiated architecture kickoff for the first language/runtime decision.

## Required Outputs
- RFC technical approach sections completed.
- Implementation plan technical breakdown completed.
- ADR(s) for architecture-impacting decisions in `docs/03-engineering/decision-records/`.
- Explicit risk/tradeoff notes for Requirements and Implementing Developer handoff.

## Decision Rights
- Final decision maker for technical architecture within approved product scope.
- Must escalate to stakeholder when technical feasibility conflicts with core product constraints.
- For product owner vs architect feasibility/value conflicts, escalate directly to stakeholder.

## Handoff Contract
- Receives: Product Owner intake and backlog priority.
- Hands off to Requirements Engineer:
  - architecture constraints,
  - interface assumptions,
  - technical risk notes.
- Hands off to Implementing Developer:
  - architecture blueprint,
  - implementation constraints,
  - ADR references.

## Done Criteria
Architect work is complete when:
- Technical approach is documented and internally consistent.
- Architecture-impacting decisions are recorded as ADRs.
- Feasibility risks and constraints are explicit.
- Implementing Developer can execute without unresolved architecture ambiguity.

## Anti-Patterns
- Premature overengineering for hypothetical scale.
- Choosing stack/tools without explicit tradeoff documentation.
- Silent scope expansion through architectural complexity.
- Deferring key interface decisions to implementation without rationale.

## Quality Bar (Target)
9+/10 means:
- Clear, minimal architecture with justified tradeoffs.
- Strong alignment to product constraints.
- Zero critical ambiguity at implementation handoff.

## Current Project Defaults
- Primary target OS for MVP: macOS.
- Linux/Windows support is deferred unless macOS-first execution reveals blocking issues.

## Proactive Review
- Regular cadence (every 3 days): ADR drift checks on active/open work.
- Deep cadence (every 7 days): architecture consistency and coupling risk review.
- If overdue, run proactive review first and update `docs/00-governance/proactive-review-schedule.md`.
