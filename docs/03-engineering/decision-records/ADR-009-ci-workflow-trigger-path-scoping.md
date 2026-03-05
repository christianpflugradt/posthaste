# ADR-009: CI Workflow Trigger Path Scoping

## Status
Accepted

## Context
PB-0010 identified avoidable CI churn caused by workflows running on commits that only modify non-impacting directories (`backlog/`, `docs/`, `eval/`). Existing CI architecture decisions define gate ordering (ADR-006) but do not define trigger relevance boundaries. Without an explicit trigger-scoping policy, workflows continue to consume runner time and slow signal quality.

## Decision
Adopt path-scoped trigger rules for CI workflows with fail-safe coverage constraints:
1. Exclude non-impacting directories from workflow triggers where appropriate (`backlog/**`, `docs/**`, `eval/**`).
2. Preserve always-trigger coverage for root-level build/config files (`Cargo.toml`, `Cargo.lock`, `Makefile`).
3. Treat `.github/workflows/**` changes as globally relevant for in-scope workflows to avoid configuration drift.
4. Keep trigger filters explicit per workflow so relevance boundaries are reviewable and auditable.

## Consequences
- Positive:
  - reduces redundant workflow executions and CI noise.
  - improves feedback-loop speed for contributors.
  - keeps trigger behavior auditable and deterministic.
- Negative:
  - trigger filters can regress if path patterns drift from repository structure.
  - requires periodic review as new relevant directories/files are introduced.
- Neutral:
  - does not change QA gate strictness or test policy.

## Alternatives Considered
- No path filtering: rejected due continued redundant CI churn.
- Global blanket exclusions only: rejected because it is brittle and can hide workflow-specific relevance needs.
- Event-type-only filtering (without path scoping): rejected because it does not address irrelevant-change triggers.

## Revisit Triggers
- Frequent false-negative trigger misses.
- Significant repository layout changes affecting relevance boundaries.
- New workflows with materially different input surfaces.

## Links
- RFC: `docs/03-engineering/rfcs/RFC-0010-pb-0010-ci-workflow-trigger-path-filtering.md`
- Related ADRs: ADR-002, ADR-006
- Related backlog items: PB-0010
- Related PRs/commits: TBD
