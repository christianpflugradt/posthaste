# ADR-008: Dependency and Tooling Policy

## Status
Accepted

## Context
Project constraints require open-source/non-paid tooling, security-aware dependency management, and low operational complexity.

## Decision
Adopt the following default policy:
- stdlib-first implementation approach,
- add external crates only with clear justification,
- no paid-only tooling dependency in core workflow,
- open-source tooling/dependencies by default,
- security pre-check required before adding new dependencies.

## Consequences
- Positive:
  - lower supply-chain and operational complexity.
  - stronger long-term maintainability.
- Negative:
  - may reduce initial implementation speed for some features.
- Neutral:
  - justified exceptions remain possible via stakeholder consultation.

## Alternatives Considered
- pragmatic crate-first approach: rejected for MVP baseline.

## Revisit Triggers
- sustained delivery bottlenecks caused by stdlib-only constraints.
- unavoidable dependency needs with strong justification.

## Links
- RFC: TBD
- Related ADRs: ADR-001, ADR-004
- Related backlog items: PB-0002
- Related PRs/commits: TBD
