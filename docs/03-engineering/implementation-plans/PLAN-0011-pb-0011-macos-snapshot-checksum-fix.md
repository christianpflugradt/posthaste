# Implementation Plan: PB-0011 macOS snapshot checksum command failure

## Objective
Fix snapshot checksum generation on macOS runners with a portable workflow strategy that preserves checksum artifact usability.

## Tasks
1. Replace non-portable checksum invocation with OS-specific command logic in `release-policy` snapshot workflow.
2. Normalize checksum output formatting across OS branches.
3. Validate snapshot artifact checksum output remains consumable by downstream verification instructions.

## Dependencies
- ADR-010 portable checksum command strategy.
- RFC-0011 architecture constraints and acceptance criteria.
- Existing release-policy workflow structure from PB-0008 baseline.

## Technical Constraints For Implementation
- No external paid tooling or unnecessary dependencies.
- Keep checksum generation hard-blocking for snapshot artifact integrity.
- Limit code changes to workflow YAML and related documentation/evidence only.
- Preserve existing snapshot artifact naming/versioning behavior.

## Interface Assumptions
- Workflow steps are the operational interface; command selection depends on runner OS.
- Checksum file remains a plain text artifact expected by downstream release consumers.

## Risk Notes For Handoff
- Branch-specific script drift could reintroduce platform failures.
- Formatting divergence could break checksum verification tooling compatibility.
- Runner-image utility changes may require periodic command review.

## Verification
- Unit tests: N/A (workflow behavior slice).
- Integration tests: CI run evidence for macOS snapshot success and checksum file output.
- Evaluation checks: N/A (non-AI behavior change).

## Rollout Notes
- Requirements Engineer finalizes ready-state criteria after Architect completion.
- Implementing Developer provides before/after workflow evidence and checksum sample output in handoff package.
