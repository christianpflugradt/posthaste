# RFC: PB-0007 Release Artifacts and Checksums

## Feature Name
PB-0007 release artifacts and checksums

## Problem
Without packaged binaries and checksum evidence, users cannot reliably consume releases or verify artifact integrity.

## Proposed Solution
Define implementation-ready requirements for publishing per-target binaries and release checksums from GitHub releases, aligned with current signing deferral policy.

## User Value
Users can download supported-target binaries and verify integrity before execution.

## Scope
- In scope:
  - Release assets for supported targets.
  - Deterministic checksum generation and publication.
  - Traceable artifact naming and mapping to build outputs.
- Out of scope:
  - Artifact signing and key-management rollout.
  - Package-manager distribution.
  - Auto-update delivery.

## Functional Requirements
- FR-001: Release workflow publishes binaries for all supported targets defined by architecture baseline.
- FR-002: Release workflow publishes one consolidated checksum file per release covering all target artifacts.
- FR-003: Artifact names and checksum entries are deterministic and stable for a given version/build output.
- FR-004: Release notes include checksum verification instructions for MVP usability.
- FR-005: No signing step is included in this slice; signing remains deferred.

## Non-Functional Requirements
- NFR-001: Artifact and checksum generation remains reproducible across release runs for equivalent inputs.
- NFR-002: Release outputs remain traceable to CI build outputs and commit/release identifiers.
- NFR-003: Requirements and acceptance criteria remain traceable to PB-0007 and ADR-005/ADR-007.

## Technical Plan
- Reuse build matrix outputs to generate release assets.
- Produce consolidated checksum manifest and publish with binaries.
- Keep signing explicitly absent until key-management policy is introduced.

## Risks
- Naming mismatch between artifacts and checksum manifest can block user verification.
- Missing or unclear release-note verification instructions can reduce practical usability.

## Test Plan
- Validate each target artifact is present in release outputs.
- Validate checksum manifest includes all published target binaries.
- Validate checksum instructions are present and executable by users.

## Evaluation Plan
- No AI-evaluation run required for this slice because no AI behavior changes.

## Assumptions
- Assumption A1: Use one consolidated checksum file per release for operator simplicity.
- Assumption A2: Include checksum verification instructions directly in release notes for MVP.

## Acceptance Criteria
- AC-001: Requirements explicitly define artifact and checksum publication contract for supported targets.
- AC-002: Determinism, traceability, and no-signing boundaries are testable and unambiguous.
- AC-003: Verification mapping and traceability are complete for implementation handoff.

## Verification Intent Mapping
| Acceptance Criterion | Verification Intent |
| --- | --- |
| AC-001 | Release configuration and artifact inspection confirm per-target binaries plus consolidated checksum file. |
| AC-002 | Evidence review confirms deterministic naming, checksum reproducibility intent, and explicit absence of signing step. |
| AC-003 | Traceability review confirms PB-0007 requirements map to ADR-005/ADR-007 and planned release evidence. |

## Requirement Traceability Notes
| Requirement | Traceability |
| --- | --- |
| FR-001, NFR-002 | ADR-005, ADR-007, PB-0007 intake |
| FR-002, FR-003, NFR-001 | PB-0007 intake constraints on deterministic/traceable checksums |
| FR-004, A2 | PB-0007 intake question on release-note verification instructions |
| FR-005 | PB-0007 constraint: signing deferred until key-management policy exists |
| NFR-003, AC-003 | PB-0007 backlog item, RFC-0001 architecture baseline |
