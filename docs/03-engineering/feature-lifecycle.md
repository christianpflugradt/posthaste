# Feature Lifecycle

## Phase 1: Intake and Product Framing
Owner: Product Owner Agent

Required artifacts:
- Stakeholder intake brief (`templates/stakeholder-intake.md`).
- Draft problem statement and desired user outcome.
- Classification: feature, bugfix, experiment, or defer/reject.
- Initial constraints, assumptions, and success signal.

Exit criteria:
- Stakeholder confirms framing direction.

## Phase 2: Specification
Owner: Architect Agent + Requirements Engineer Agent

Required artifacts:
- RFC using `docs/03-engineering/rfc-template.md` or `templates/feature-rfc.md`.
- Implementation plan using `templates/implementation-plan.md`.

Exit criteria:
- RFC and plan approved.

## Phase 3: Implementation
Owner: Implementing Developer Agent

Required artifacts:
- Code changes scoped to approved RFC.
- Tests for new or changed behavior.
- Docs updates where applicable.

Exit criteria:
- Implementation complete and local verification executed.

## Phase 4: Verification
Owner: Quality Engineer Agent + Security Engineer Agent

Required artifacts:
- Test run results.
- Evaluation report for AI behavior changes (`templates/evaluation-report.md`).
- Security findings note for relevant changes.

Exit criteria:
- Merge and AI gates in `docs/04-quality/quality-gates.md` are satisfied.

## Phase 5: Review
Owner: Reviewing Developer Agent

Required artifacts:
- Review report using `templates/review-report.md`.
- Findings with severities and dispositions.

Exit criteria:
- No unresolved blocking findings.

## Phase 6: Release
Owner: Product Owner Agent + Stakeholder

Required artifacts:
- Release checklist (`templates/release-checklist.md`).
- Release notes/changelog entry.

Exit criteria:
- Stakeholder go/no-go recorded.
- Rollback plan confirmed.
