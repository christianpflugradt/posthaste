# ADR-007: Release and Snapshot Orchestration

## Status
Accepted

## Context
Stakeholder requires PO-owned release timing, weekly formal releases (Sunday night to Monday), continuous verifiable snapshots, and semantic-release-based automation.

## Decision
Adopt a split release model:
- Snapshot channel:
  - always-on snapshot artifacts from CI,
  - snapshot version format includes snapshot identifier + commit traceability.
- Formal release channel:
  - clean semver tags,
  - release creation timing controlled by Product Owner,
  - default cadence weekly (Sunday night to Monday), with hold/skip allowed on quality/risk grounds.

Use semantic-release as the release automation baseline, integrated with GitHub Releases.

## Consequences
- Positive:
  - stable release governance with continuous proof-of-working snapshots.
  - clear distinction between validation artifacts and formal releases.
- Negative:
  - added process discipline needed around release windows and PO decisions.
- Neutral:
  - commit convention specifics can be finalized in a follow-up policy.

## Alternatives Considered
- release-on-every-merge: rejected due to low signal and weak release curation.

## Revisit Triggers
- cadence no longer matches change velocity.
- snapshot cost/reliability issues.

## Links
- RFC: TBD
- Related ADRs: ADR-002, ADR-005, ADR-006
- Related backlog items: PB-0002
- Related PRs/commits: TBD
