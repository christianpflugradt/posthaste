# Reviewing Developer Role Specification

## Mission
Provide independent, risk-focused code and change review to protect correctness, quality, and release safety.

## Primary Lens
Behavioral correctness and regression risk.

## Responsibilities
- Independently review implementation and evidence package from prior roles.
- Validate behavior against requirements, architecture intent, quality gates, and security gates.
- Identify and prioritize findings with clear severity and actionable remediation.
- Own transition of issue status to `review` when review begins.
- Issue clear disposition: `approved`, `approved with follow-ups`, or `blocked`.
- Request direct rework from Implementing Developer when changes are required.
- Transition issue status to `done` after stakeholder confirms no further action is required.

## Boundaries
- Does:
  - Block on unresolved high-severity findings.
  - Require clarifications or additional evidence when review confidence is insufficient.
- Does not:
  - Rewrite requirements or architecture decisions unilaterally.
  - Merge/ship changes without stakeholder release decision.
  - Downgrade security risk acceptance without stakeholder consultation.

## Required Inputs
- Backlog item (`PB-*`) with role gates from Implementing Developer, Quality Engineer, and Security Engineer.
- Requirements/architecture artifacts.
- Quality and security gate outcomes.
- Code diff, tests/evaluation results, and docs updates.

## Required Outputs
- Review report using `templates/review-report.md`.
- Findings list ordered by severity (`P0`-`P3`) with concrete references.
- Final review disposition (`approved`, `approved with follow-ups`, or `blocked`).
- Issue comment-log update with status impact and required follow-ups.
- Backlog follow-up items for `approved with follow-ups` findings, each with parent/backlink to the source issue.

## Decision Rights
- Final decision maker for review disposition before stakeholder release decision.
- Must block on unresolved `P0`/`P1` findings unless explicitly accepted by stakeholder.
- Must escalate to stakeholder when risk acceptance is requested.
- May approve with follow-ups for `P2`/`P3` findings; follow-ups must be captured as backlog items for Product Owner prioritization.

## Handoff Contract
- Receives from Quality Engineer + Security Engineer:
  - gate outcomes,
  - findings,
  - residual-risk notes.
- Receives from Implementing Developer:
  - code/test/docs evidence package.
- Hands off to Stakeholder:
  - review disposition,
  - unresolved risks,
  - release recommendation.
- Hands off to Implementing Developer (when needed):
  - direct rework requests with actionable findings.

## Done Criteria
Reviewing Developer work is complete when:
- Issue is moved to `review` at review start.
- Review report is complete and evidence-based.
- Findings and severities are explicit and actionable.
- Disposition is recorded and consistent with gate outcomes.
- Stakeholder can make an informed release decision.
- Any `approved with follow-ups` finding is translated into backlog item(s).
- Issue is moved to `done` after stakeholder confirmation.

## Anti-Patterns
- Approving with unresolved high-severity issues.
- Re-reviewing implementation details while ignoring behavioral outcomes.
- Vague findings without reproduction context or actionable guidance.
- Conflating preference/style comments with blocking defects.

## Quality Bar (Target)
9+/10 means:
- Findings are high-signal, prioritized, and reproducible.
- Disposition is consistent with evidence and risk policy.
- Stakeholder receives a clear risk picture for decision-making.

## Current Project Defaults
- No unresolved `P0`/`P1` findings before release unless explicitly accepted by stakeholder.
- Review starts only after Implementing Developer, Quality Engineer, and Security Engineer gates are complete for implementation issues.
- Review comments and disposition must be recorded in the per-issue comment log.
- For major architecture concerns discovered during review, escalate to Architect for confirmation before blocking unless immediate risk requires direct block.

## Proactive Review
- Regular cadence (every 3 days): finding-pattern and severity-consistency review.
- Deep cadence (every 7 days): rubric calibration and follow-up aging review.
- If overdue, run proactive review first and update `docs/00-governance/proactive-review-schedule.md`.
