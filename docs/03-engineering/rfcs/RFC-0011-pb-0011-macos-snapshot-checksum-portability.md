# RFC: PB-0011 macOS snapshot checksum portability fix

## Summary
Define architecture and implementation constraints to remove macOS checksum command failure in snapshot workflow while preserving checksum artifact validity across runners.

## Problem Statement
`release-policy` snapshot workflow currently assumes `sha256sum` exists on all runners. On macOS this fails, breaking snapshot artifact processing and reducing release pipeline reliability.

## User Impact
- Release workflow operators get consistent, reliable snapshot checksum generation on all supported targets.
- Contributors avoid noisy CI failures unrelated to product code changes.

## Goals
- Eliminate macOS checksum command failure.
- Preserve deterministic checksum artifact format for downstream verification.
- Minimize workflow complexity and dependency surface.

## Functional Requirements
- FR-001: Snapshot checksum step must succeed on macOS runners without relying on unavailable `sha256sum`.
- FR-002: Checksum generation logic must preserve successful behavior on non-macOS runners.
- FR-003: Checksum output format must be normalized to a single cross-platform line contract (`sha256  filename`) for downstream use.
- FR-004: Checksum generation remains hard-blocking for snapshot artifact publication.
- FR-005: Implementation scope is limited to workflow/configuration behavior needed for checksum portability in this slice.

## Non-Functional Requirements
- NFR-001: Solution remains dependency-light and uses runner-available native tooling only.
- NFR-002: Output behavior is deterministic and auditable across supported runner types.
- NFR-003: Requirement and acceptance traceability is maintained from PB-0011 intake through ADR-010 and implementation evidence.

## Non-Goals
- Redesign release cadence or artifact publication model.
- Introduce external checksum tooling dependencies.
- Change supported platform matrix.

## Proposed Approach
- Apply OS-specific checksum generation commands in workflow steps.
- Normalize output to a shared checksum line format (`sha256  filename`).
- Keep checksum generation as a mandatory blocking step for snapshot artifacts.
- Scope changes to workflow logic only (no runtime binary behavior change).

## Architecture Constraints and Interface Assumptions
- Trigger and execution context remain GitHub Actions-native.
- Workflow step boundaries are the integration interface; no application code API changes are required.
- Output contract for checksum file must remain compatible with current release verification instructions.
- Strategy is governed by ADR-010 and aligned with ADR-007 release/snapshot orchestration.

## Alternatives Considered
- Global single command (`sha256sum`) for all runners.
- Installing additional checksum utilities during workflow run.
- Post-processing checksums outside CI.

## Risks & Mitigations
- Risk: output formatting mismatch across OS branches.
  - Mitigation: explicit formatting normalization and verification checks in implementation handoff.
- Risk: future runner-image changes alter default tool availability.
  - Mitigation: keep OS-specific logic explicit and documented in ADR revisit triggers.

## Rollout Plan
1. Requirements Engineer refines acceptance criteria and verification scenarios.
2. Implementing Developer updates `release-policy` checksum step logic.
3. QE and Security validate correctness and operational safety before review.

## Testing Plan
- Validate macOS snapshot job no longer fails at checksum step.
- Validate checksum output format consistency across OS branches.
- Validate downstream checksum artifact remains usable for verification guidance.

## Evaluation Plan
- No AI evaluation required (CI workflow configuration fix only).

## Open Questions
- None blocking for architecture handoff.

## Assumptions
- Assumption A1: Matching checksum file format across all OS targets is a hard requirement for this fix.
- Assumption A2: This fix applies first to snapshot workflow path as scoped by PB-0011; broader workflow rollout can be follow-up if needed.

## Acceptance Criteria
- Architected solution removes dependency on unavailable checksum commands per runner.
- Output contract remains stable for downstream release/snapshot verification.
- No unresolved architecture ambiguity for RE/implementation handoff.

## Verification Intent Mapping
| Acceptance Criterion | Verification Intent |
| --- | --- |
| Removes unavailable command dependency per runner | CI evidence confirms macOS snapshot step no longer fails with missing `sha256sum`, while other runners still pass checksum step. |
| Output contract remains stable | Artifact sample review confirms normalized checksum line format consistency across runner branches. |
| No unresolved architecture ambiguity | PB-0011 gate/comment review confirms Architect and Requirements Engineer handoff completeness for implementation start. |

## Requirement Traceability Notes
| Requirement | Traceability |
| --- | --- |
| FR-001, FR-002, NFR-002 | PB-0011 intake problem statement and desired outcome |
| FR-003, A1 | PB-0011 intake question on checksum format consistency |
| FR-004, NFR-001 | ADR-010 strategy and implementation-plan hard-blocking constraint |
| FR-005, A2 | PB-0011 intake question on fix scope (snapshot-only vs wider rollout) |
| NFR-003 | PB-0011 backlog item, ADR-010, PLAN-0011 verification notes |

## Architect Handoff Notes
- Implementation constraints and verification intent are detailed in `docs/03-engineering/implementation-plans/PLAN-0011-pb-0011-macos-snapshot-checksum-fix.md`.
- Architecture-impacting portability decision is recorded in ADR-010.
