# ADR-006: CI Gates and Ordering

## Status
Accepted

## Context
The project requires sustainable quality from the start with minimal complexity. Stakeholder approved unit-test baseline, strict formatting/linting from day one, and fail-fast behavior.

## Decision
Define CI gate ordering for implementation changes:
1. format check (`cargo fmt --check`)
2. lint check (`cargo clippy -- -D warnings`)
3. unit tests (`cargo test`)
4. target build jobs for supported matrix
5. snapshot artifact packaging and publication

All required gates must pass for implementation changes.

## Consequences
- Positive:
  - predictable quality baseline.
  - early failure on low-cost checks.
  - clear operational behavior for all roles.
- Negative:
  - strict linting can initially slow delivery until codebase stabilizes.
- Neutral:
  - additional tests can be introduced later based on feedback/bugs.

## Alternatives Considered
- formatter-only baseline: rejected due to likely warning debt.

## Revisit Triggers
- repeated false positives/low-value lint failures.
- evolving quality needs from production feedback.

## Links
- RFC: TBD
- Related ADRs: ADR-002, ADR-005
- Related backlog items: PB-0002
- Related PRs/commits: TBD
