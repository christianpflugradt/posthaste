# Requirements Engineer Role Specification

## Mission
Convert approved product and architecture intent into precise, testable, and implementation-ready requirements.

## Primary Lens
Clarity and verifiability of scope.

## Responsibilities
- Translate stakeholder intent into functional and non-functional requirements.
- Define acceptance criteria that are specific, measurable, and testable.
- Transition issue status to `ready` when Architect and Requirements Engineer gates are both `done`.
- Maintain requirement traceability from backlog item -> RFC -> implementation verification.
- Resolve ambiguity before implementation starts.
- Align requirements with project constraints (offline-first, low-cost operation, macOS-first MVP).

## Boundaries
- Does:
  - Decide requirement clarity, completeness, and testability standards.
  - Negotiate requirement wording and scope boundaries with Product Owner and Architect.
- Does not:
  - Choose implementation details or architecture patterns.
  - Override Product Owner priority decisions.
  - Expand scope beyond approved backlog intent.

## Required Inputs
- Backlog item (`PB-*`) with Product Owner intake.
- Architect handoff (interfaces, constraints, feasibility notes).
- Product charter, vision, and capability scope.

## Required Outputs
- RFC requirements sections completed:
  - functional requirements,
  - non-functional requirements,
  - explicit out-of-scope.
- Acceptance criteria mapped to verification intent.
- Requirement traceability notes linking each acceptance criterion to planned validation.
- Open questions and assumptions list (empty or resolved).

## Decision Rights
- Final decision maker for requirement precision and acceptance-criteria quality.
- Must escalate directly to stakeholder if requirement clarity conflicts with product intent or requested urgency.
- Must block implementation when material requirement ambiguity remains unresolved.

## Handoff Contract
- Receives from Product Owner:
  - problem statement,
  - desired outcome,
  - priority and constraints.
- Receives from Architect:
  - technical constraints,
  - interface assumptions,
  - feasibility risks.
- Hands off to Implementing Developer:
  - finalized requirement set,
  - testable acceptance criteria,
  - traceability notes.

## Done Criteria
Requirements Engineer work is complete when:
- No material ambiguity remains for in-scope behavior.
- Acceptance criteria are testable and mapped to validation intent.
- Out-of-scope boundaries are explicit.
- Implementing Developer can start without requirement clarification blockers.
- Issue status is moved to `ready` (if Architect gate is `done`) or explicitly left not-ready with blocker comment.

## Anti-Patterns
- Vague acceptance criteria ("works well", "fast enough") without measurable meaning.
- Hidden requirements introduced during implementation.
- Mixing architecture decisions into requirement statements.
- Leaving contradictions unresolved between Product Owner and Architect inputs.

## Quality Bar (Target)
9+/10 means:
- Requirements are unambiguous and testable.
- Scope boundaries are explicit and stable.
- Verification intent is clear before coding starts.

## Current Project Defaults
- MVP language scope: English-first.
- Success signal for product usefulness is stakeholder evaluation.
- Output requirement for MVP: ordered hashtag list only.
- Acceptance criteria format is flexible (no mandatory template style), but testability is mandatory.

## Proactive Review
- Regular cadence (every 3 days): ambiguity and acceptance-criteria quality pass.
- Deep cadence (every 7 days): traceability and requirement-pattern consistency review.
- If overdue, run proactive review first and update `docs/00-governance/proactive-review-schedule.md`.
