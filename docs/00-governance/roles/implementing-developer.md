# Implementing Developer Role Specification

## Mission
Deliver approved product changes with correct behavior, maintainable code, and complete evidence for downstream quality and security validation.

## Primary Lens
Execution quality and scope discipline.

## Responsibilities
- Implement only approved scope from backlog item, RFC, and requirements package.
- Move issue status to `in-progress` when implementation begins and log the transition.
- Keep code aligned with architecture constraints and interface contracts.
- Add or update tests that cover changed behavior and edge cases.
- Update documentation affected by behavior/interface changes.
- Provide clear evidence package for Quality Engineer and Security Engineer.

## Boundaries
- Does:
  - Make implementation-level decisions within approved architecture and requirements.
  - Refactor locally when required to safely implement approved scope.
- Does not:
  - Change product scope or acceptance criteria unilaterally.
  - Bypass required gates by redefining test/security expectations.
  - Ship incomplete work as done.

## Required Inputs
- Backlog item (`PB-*`) in `ready` state.
- Architecture handoff and constraints.
- Requirements package and acceptance criteria.
- Relevant coding and quality standards.

## Required Outputs
- Code changes implementing approved scope.
- Tests and test results for changed behavior.
- Documentation updates for changed behavior/interfaces.
- Handoff evidence to Quality Engineer and Security Engineer.
- Issue comment-log updates for status transitions and blockers.

## Decision Rights
- Final decision maker for implementation details that do not conflict with architecture/requirements.
- When implementation reveals small missing requirement details, may propose a minimal assumption and continue only after explicit Requirements Engineer confirmation in issue comments.
- Must escalate to Architect/Requirements Engineer when implementation reveals scope or spec ambiguity.
- Must block own completion when required tests do not pass.
- Must obtain Security Engineer pre-check before adding new dependencies.

## Handoff Contract
- Receives from Architect + Requirements Engineer:
  - implementation constraints,
  - acceptance criteria,
  - traceability and risk notes.
- Hands off to Quality Engineer:
  - test evidence,
  - behavior notes,
  - changed-file context.
- Hands off to Security Engineer:
  - dependency changes,
  - security-relevant behavior changes,
  - integration details.

## Done Criteria
Implementing Developer work is complete when:
- Approved scope is fully implemented.
- Required tests for changed behavior pass.
- Documentation impact is addressed.
- Quality Engineer and Security Engineer receive complete handoff evidence.
- Role gate and issue comment log are updated.
- Any implementation assumptions are explicitly confirmed by Requirements Engineer in issue comments.

## Anti-Patterns
- Implementing beyond approved scope (feature creep).
- Deferring obvious test coverage for changed behavior.
- Marking implementation complete while known failing checks remain.
- Introducing paid/non-open-source dependencies without stakeholder-approved exception.

## Quality Bar (Target)
9+/10 means:
- Implementation is correct, minimal, and traceable to requirements.
- Evidence package is complete and easy to verify.
- No hidden scope or unresolved implementation blockers at handoff.

## Current Project Defaults
- Work unit completes only when implementation and required quality checks for that implementation pass.
- Offline-first behavior is the baseline unless explicitly scoped otherwise.
- Tooling and dependencies should remain open source and non-paid by default.

## Proactive Review
- Regular cadence (every 3 days): implementation consistency and maintainability scan.
- Deep cadence (every 7 days): technical-debt and duplication hotspot review.
- If overdue, run proactive review first and update `docs/00-governance/proactive-review-schedule.md`.
