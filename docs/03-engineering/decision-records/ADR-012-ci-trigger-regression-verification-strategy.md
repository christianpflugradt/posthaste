# ADR-012: CI Trigger Regression Verification Strategy

## Status
Accepted

## Context
PB-0010 introduced path-scoped workflow triggering (ADR-009). Without dedicated regression checks, trigger logic can drift silently and either reintroduce redundant runs or suppress required runs.

## Decision
Adopt a deterministic script-and-fixture verification strategy for workflow trigger behavior:
1. Verify both positive (`should trigger`) and negative (`should not trigger`) scenarios for each in-scope workflow.
2. Keep checks script-based with repository fixtures for transparency and low tooling overhead.
3. Fail checks on trigger-policy drift from expected path behavior.
4. Scope coverage to current workflows; future workflow-template expansion is separate backlog scope.

## Consequences
- Positive:
  - provides explicit guardrails against trigger regressions.
  - keeps verification logic reviewable in-repo.
  - improves confidence in CI noise-reduction policy durability.
- Negative:
  - fixtures/scripts require maintenance as workflow set evolves.
  - scenario curation must avoid brittle overfitting.
- Neutral:
  - no change to runtime product behavior or release policy.

## Alternatives Considered
- No dedicated trigger regression checks: rejected due high drift risk.
- Full workflow emulator dependency: rejected due complexity/tooling overhead.
- Manual-only review process: rejected due weak repeatability.

## Revisit Triggers
- frequent false positives/false negatives in trigger checks.
- significant workflow topology changes.
- adoption of approved native tooling that materially reduces maintenance burden.

## Links
- RFC: `docs/03-engineering/rfcs/RFC-0013-pb-0013-ci-trigger-regression-tests.md`
- Related ADRs: ADR-006, ADR-009, ADR-011
- Related backlog items: PB-0013
- Related PRs/commits: TBD
