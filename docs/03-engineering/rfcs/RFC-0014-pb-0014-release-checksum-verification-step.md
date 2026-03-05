# RFC: PB-0014 Automated Checksum Verification in Release Workflows

## Feature Name
PB-0014 add automated checksum verification step to release workflows

## Problem
Checksum generation without automated verification can miss integrity mismatches before artifact publication.

## Proposed Solution
Define requirements for automated checksum verification that blocks publication on mismatch while keeping behavior portable across the current target matrix.

## User Value
Release consumers gain stronger integrity guarantees from mechanically verified artifacts.

## Scope
- In scope:
  - Add verification step(s) against generated checksums for release artifacts.
  - Define fail-closed mismatch semantics.
  - Keep verification aligned with existing target matrix and naming.
- Out of scope:
  - Artifact signing rollout.
  - External notarization/integrity services.

## Functional Requirements
- FR-001: Workflows perform checksum verification against produced artifacts before publish.
- FR-002: Verification failure must block publication (fail-closed).
- FR-003: Verification runs for both snapshots and formal releases in this slice.
- FR-004: Verification result visibility is captured in CI/job output; release-note surfacing is optional follow-up.

## Non-Functional Requirements
- NFR-001: Verification logic remains portable across current runner matrix.
- NFR-002: Runtime overhead stays reasonable for release workflows.
- NFR-003: Requirements and AC trace to PB-0014 intake and parent release-integrity objective.

## Assumptions
- Assumption A1: Verification scope includes both snapshots and formal releases.
- Assumption A2: Verification results are not required in release notes for this slice.

## Acceptance Criteria
- AC-001: Requirements explicitly define verification scope and fail-closed behavior.
- AC-002: Requirements preserve target-matrix compatibility and bounded runtime overhead expectations.
- AC-003: Verification mapping and traceability are complete for implementation handoff.

## Verification Intent Mapping
| Acceptance Criterion | Verification Intent |
| --- | --- |
| AC-001 | Workflow evidence confirms publication blocked on checksum mismatch and proceeds on valid artifacts. |
| AC-002 | Matrix run evidence confirms verification works across supported targets without unacceptable slowdown. |
| AC-003 | Traceability review confirms PB-0014 mapping from intake -> RFC -> planned validation evidence. |

## Requirement Traceability Notes
| Requirement | Traceability |
| --- | --- |
| FR-001, FR-002 | PB-0014 problem statement/acceptance signal |
| FR-003, A1 | PB-0014 intake question on snapshots vs releases scope |
| FR-004, A2 | PB-0014 intake question on release-note surfacing |
| NFR-001, NFR-002 | PB-0014 constraints on matrix support and runtime overhead |
| NFR-003, AC-003 | PB-0014 parent link PB-0007 and handoff requirements |
