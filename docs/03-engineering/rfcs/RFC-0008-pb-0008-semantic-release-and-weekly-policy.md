# RFC: PB-0008 Semantic-Release and Weekly Release Policy

## Feature Name
PB-0008 semantic-release and weekly release policy

## Problem
Without explicit automation and governance rules, snapshot and formal release behavior can drift from Product Owner policy and reduce traceability.

## Proposed Solution
Define implementation-ready requirements for semantic-release orchestration that preserves:
- continuous snapshots with traceability,
- PO-controlled formal release timing,
- default weekly formal release cadence.

## User Value
Stakeholder and contributors get predictable release operations with auditable version provenance.

## Scope
- In scope:
  - Semantic-release configuration aligned to PO-governed formal releases.
  - Continuous snapshot publication strategy.
  - Weekly formal release window policy handling.
- Out of scope:
  - Release signing/key-management rollout.
  - Non-semver formal versioning.
  - Release governance outside PO authority model.

## Functional Requirements
- FR-001: Formal releases use semver tags and are not emitted on every push/merge.
- FR-002: Formal release creation remains PO-controlled, with weekly Sunday night to Monday window as default cadence.
- FR-003: If a weekly window is skipped, release defers to the next weekly window by default; PO may explicitly authorize ad-hoc midweek formal release.
- FR-004: Snapshot publication occurs on every `main` merge and includes traceable snapshot identifiers.
- FR-005: Release automation clearly separates snapshot and formal release channels to prevent version-policy overlap.

## Non-Functional Requirements
- NFR-001: Snapshot and formal release behavior must be deterministic, auditable, and reproducible from repository state.
- NFR-002: Version metadata must support traceability to commits/CI runs.
- NFR-003: Requirements and acceptance criteria remain traceable to PB-0008 and ADR-007.

## Technical Plan
- Configure semantic-release flow for semver formal releases.
- Configure snapshot publication trigger on `main` merges with traceable naming.
- Encode weekly cadence policy and PO override semantics in release governance docs/config.

## Risks
- Misconfigured semantic-release defaults may produce unintended formal releases.
- Snapshot/formal boundary mistakes can cause version ambiguity.

## Test Plan
- Validate formal release path requires PO-controlled trigger/window decision.
- Validate snapshot path runs on every `main` merge with traceable naming.
- Validate skipped-week behavior defaults to defer with explicit PO override path.

## Evaluation Plan
- No AI-evaluation run required for this slice because no AI behavior changes.

## Assumptions
- Assumption A1: Skipped weekly formal release windows defer to the next weekly window unless PO explicitly authorizes ad-hoc midweek release.
- Assumption A2: Snapshots publish on every `main` merge as the continuous baseline trigger.

## Acceptance Criteria
- AC-001: Requirements explicitly define release-channel separation, weekly policy defaults, and PO control boundaries.
- AC-002: Snapshot trigger behavior and traceability requirements are testable and unambiguous.
- AC-003: Verification mapping and traceability are complete for implementation handoff.

## Verification Intent Mapping
| Acceptance Criterion | Verification Intent |
| --- | --- |
| AC-001 | Config/policy inspection confirms formal releases are semver, PO-controlled, and weekly-by-default with explicit override path. |
| AC-002 | CI/release evidence confirms snapshots run on `main` merges and include traceable identifiers. |
| AC-003 | Traceability review confirms PB-0008 requirements map to ADR-007 and planned release evidence. |

## Requirement Traceability Notes
| Requirement | Traceability |
| --- | --- |
| FR-001, FR-002, NFR-001 | ADR-007, PB-0008 intake |
| FR-003, A1 | PB-0008 intake question on skipped weekly window behavior |
| FR-004, A2, NFR-002 | ADR-007 snapshot traceability policy, PB-0008 intake question on snapshot trigger scope |
| FR-005 | ADR-007 release/snapshot orchestration boundary |
| NFR-003, AC-003 | PB-0008 backlog item, RFC-0001 architecture baseline |
