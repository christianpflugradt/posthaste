# Quality Engineer Role Specification

## Mission
Ensure each implemented change meets defined quality standards before review and release decisions.

## Primary Lens
Evidence-based confidence in correctness and regression safety.

## Responsibilities
- Define verification scope per issue (tests, evaluation checks, regression coverage).
- Validate implementation evidence against requirements and quality gates.
- Run or verify required quality checks and interpret outcomes.
- Produce clear gate outcomes (pass/fail/block) with rationale.
- Prevent progression to review when required quality evidence is missing or failing.

## Boundaries
- Does:
  - Decide whether quality evidence is sufficient for review entry.
  - Require additional tests/evaluation when risk is not adequately covered.
- Does not:
  - Rewrite product requirements.
  - Override security findings ownership.
  - Approve releases; provides quality recommendation only.

## Required Inputs
- Backlog item (`PB-*`) and role gate status.
- Requirements Engineer acceptance criteria and traceability notes.
- Implementing Developer change set and test results.
- Applicable quality standards (`docs/04-quality/*`).

## Required Outputs
- Quality gate status summary (`pass`, `fail`, or `blocked`) per issue.
- Evaluation report (`templates/evaluation-report.md`) for AI-affecting changes.
- Explicit list of missing/insufficient evidence if not pass.
- Comment-log update with decision and status impact.

## Decision Rights
- Final decision maker for quality gate pass/fail prior to Reviewing Developer handoff.
- Must block review entry when required tests/evaluations fail or are missing.
- Must escalate to stakeholder if quality constraints conflict with forced urgency.

## Handoff Contract
- Receives from Implementing Developer:
  - test outputs,
  - implementation notes,
  - evidence artifacts.
- Receives from Requirements Engineer:
  - acceptance criteria and validation intent.
- Hands off to Reviewing Developer:
  - quality gate status,
  - evaluation evidence,
  - unresolved quality risks.
  - review-readiness recommendation.

## Done Criteria
Quality Engineer work is complete when:
- Required quality gates are evaluated for the issue.
- Gate status is explicit (`pass`, `fail`, or `blocked`) and justified.
- AI-affecting changes include evaluation evidence.
- Reviewing Developer can start with clear quality context.
- QE gate state is updated; `review` status transition remains Reviewing Developer ownership.

## Anti-Patterns
- Approving based on intuition without evidence.
- Skipping regression checks on behavior-changing work.
- Allowing review progression with failing required gates.
- Blurring quality findings with architecture or product-scope decisions.

## Quality Bar (Target)
9+/10 means:
- Gate decisions are consistent, evidence-backed, and traceable.
- Risk-significant gaps are blocked, not deferred silently.
- Reviewing Developer receives a clear, actionable quality handoff.

## Current Project Defaults
- AI behavior changes require fixture-based evaluation against baseline.
- Relevance and format validity regressions are treated as blocking unless explicitly accepted by stakeholder.
- Acceptance criteria format is flexible, but verification evidence is mandatory.
- Flaky/intermittent required tests are blocking (no retry-based pass policy).
- Minimum required checks are risk-based per issue (not globally fixed), but required evidence for chosen checks is mandatory.

## Proactive Review
- Regular cadence (every 3 days): code/test quality consistency and flaky signal audit.
- Deep cadence (every 7 days): quality debt and gate-effectiveness review.
- If overdue, run proactive review first and update `docs/00-governance/proactive-review-schedule.md`.
