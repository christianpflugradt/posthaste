# ADR-011: GitHub Actions SHA Pinning Policy

## Status
Accepted

## Context
PB-0012 targets CI/release supply-chain hardening by replacing moving action tags with immutable commit SHA references. Existing workflows currently reference action tags, which can drift unexpectedly and introduce nondeterministic behavior over time.

## Decision
Adopt a SHA-pinning policy for in-scope GitHub Actions workflows:
1. Pin action references in `.github/workflows/*.yml` to immutable commit SHAs.
2. Preserve current workflow behavior; pinning is a security-hardening change, not functional redesign.
3. Define a monthly default refresh cadence for pins.
4. Track automation of pin-refresh as separate backlog scope; not required in this slice.

## Consequences
- Positive:
  - reduces action supply-chain drift risk.
  - improves reproducibility and auditability of workflow behavior.
  - aligns with deterministic CI policy direction.
- Negative:
  - requires periodic maintenance to refresh SHAs.
  - increases friction when manually updating action versions.
- Neutral:
  - does not change release cadence, build matrix, or QA gate semantics.

## Alternatives Considered
- Keep moving tags: rejected due drift risk.
- Use paid dependency-management tooling for pin refresh: rejected by tooling policy.
- Pin only high-privilege workflows: rejected for inconsistent hardening posture.

## Revisit Triggers
- Repeated incidents involving stale action SHAs.
- Significant GitHub Actions ecosystem changes impacting pinning practices.
- Introduction of approved automated pin-refresh workflow.

## Links
- RFC: `docs/03-engineering/rfcs/RFC-0012-pb-0012-actions-sha-pinning-security-hardening.md`
- Related ADRs: ADR-002, ADR-006, ADR-010
- Related backlog items: PB-0012
- Related PRs/commits: TBD
