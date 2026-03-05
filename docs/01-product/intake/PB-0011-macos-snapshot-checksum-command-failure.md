# Stakeholder Intake Brief

## Raw Stakeholder Input
macOS snapshot step in release policy workflow fails because `sha256sum` is not available on macOS runners (`command not found`, exit code 127).

## Why Now
The failure blocks snapshot publication reliability and impacts every commit path that relies on this workflow.

## Problem Statement
Release-policy workflow uses a Linux-specific checksum command in a cross-platform path, causing macOS snapshot job failure.

## Target User Outcome
Snapshot workflow succeeds on macOS runners and produces checksums with a command available on that platform.

## Proposed Feature Slice
Fix workflow checksum generation for macOS compatibility while preserving consistent checksum output behavior across targets.

## Non-Goals
- Rewriting full release orchestration.
- Changing release cadence/governance policy.
- Altering artifact naming/versioning strategy beyond what is needed for checksum-step compatibility.

## Constraints
- Time: urgent fix due continuous workflow impact.
- Quality: must avoid regressions on Linux/Windows jobs while fixing macOS.
- Technical: choose portable checksum approach; Requirements Engineer may refine exact command strategy and output normalization.

## Risks and Unknowns
- Different checksum tools may output different filename/path formats.
- If output format diverges per OS, downstream verification/release steps may break.

## Success Signal
Stakeholder confirms macOS snapshot workflow run succeeds and checksum artifacts remain usable and consistent with release expectations.

## Recommendation
- [x] Proceed to RFC
- [ ] Defer
- [ ] Reject
- [ ] Need clarification

## Questions for Stakeholder
1. Is matching checksum file format across all OS targets a hard requirement for this fix?
2. Should this fix be scoped strictly to snapshot workflow, or applied to all workflows that generate checksums?
