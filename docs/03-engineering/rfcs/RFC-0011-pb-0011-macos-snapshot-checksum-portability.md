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

## Acceptance Criteria
- Architected solution removes dependency on unavailable checksum commands per runner.
- Output contract remains stable for downstream release/snapshot verification.
- No unresolved architecture ambiguity for RE/implementation handoff.

## Architect Handoff Notes
- Implementation constraints and verification intent are detailed in `docs/03-engineering/implementation-plans/PLAN-0011-pb-0011-macos-snapshot-checksum-fix.md`.
- Architecture-impacting portability decision is recorded in ADR-010.
