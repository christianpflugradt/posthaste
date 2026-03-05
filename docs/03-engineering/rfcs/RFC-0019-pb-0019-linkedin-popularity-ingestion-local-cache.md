# RFC: PB-0019 LinkedIn Popularity Ingestion with Local Cache

## Feature Name
PB-0019 LinkedIn hashtag popularity ingestion with local cache

## Problem
Static popularity priors drift from current usage and weaken ranking quality over time.

## Proposed Solution
Define requirements for popularity ingestion plus local cache/fallback behavior that improves ranking while preserving offline usability.

## User Value
Users receive hashtag ordering better aligned with current LinkedIn popularity patterns without requiring always-online operation.

## Scope
- In scope:
  - Popularity ingestion contract and local cache behavior.
  - Freshness/refresh policy requirements.
  - Offline fallback semantics for stale/unavailable upstream data.
- Out of scope:
  - Full analytics platform.
  - Always-online dependency.

## Functional Requirements
- FR-001: System ingests popularity signals from configured source and persists locally.
- FR-002: Ranking path reads popularity from local cache first.
- FR-003: Cache freshness target for MVP is 24 hours.
- FR-004: Ingestion trigger model is hybrid: scheduled refresh plus manual on-demand trigger.
- FR-005: When ingestion fails or cache is stale, ranking falls back to last known cache/static priors without hard failure.

## Non-Functional Requirements
- NFR-001: Offline behavior remains usable with predictable fallback.
- NFR-002: Cache format/versioning is stable and auditable for downstream ranking integration.
- NFR-003: Requirements and AC trace to PB-0019 intake and parent ranking objectives.

## Assumptions
- Assumption A1: MVP cache freshness target is 24 hours.
- Assumption A2: MVP ingestion trigger strategy is hybrid (scheduled + manual).

## Acceptance Criteria
- AC-001: Requirements explicitly define ingestion, cache, and fallback behavior boundaries.
- AC-002: Requirements define freshness and trigger policy with clear failure semantics.
- AC-003: Verification mapping and traceability are complete for implementation handoff.

## Verification Intent Mapping
| Acceptance Criterion | Verification Intent |
| --- | --- |
| AC-001 | Design/evidence review confirms ingestion path, local cache usage, and fallback semantics are implemented as specified. |
| AC-002 | Scenario checks confirm stale/unavailable ingestion does not hard-fail ranking and refresh policy is enforceable. |
| AC-003 | Traceability review confirms PB-0019 mapping from intake -> RFC -> planned validation evidence. |

## Requirement Traceability Notes
| Requirement | Traceability |
| --- | --- |
| FR-001, FR-002 | PB-0019 intake problem/target outcome |
| FR-003, A1 | PB-0019 intake question on acceptable freshness target |
| FR-004, A2 | PB-0019 intake question on manual/scheduled/hybrid triggering |
| FR-005, NFR-001 | PB-0019 constraint: preserve useful offline behavior |
| NFR-002, NFR-003, AC-003 | PB-0019 parent link and handoff requirements |
