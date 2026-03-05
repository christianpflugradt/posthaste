# Implementation Plan: PB-0010 CI Workflow Trigger Path Filtering

## Objective
Apply explicit, low-risk path filters to CI workflows so irrelevant directory-only changes do not trigger redundant runs while preserving required validation coverage.

## Tasks
1. Map each in-scope workflow to relevant trigger paths and explicit exclusions.
2. Update workflow `on.push.paths` / `on.pull_request.paths` rules to enforce scoped triggering with fail-safe inclusions.
3. Validate scenario matrix for irrelevant-only changes, relevant source/build changes, and workflow-config edits.

## Dependencies
- RFC-0010 requirements and acceptance criteria.
- ADR-009 trigger-path scoping policy.
- Existing workflow definitions in `.github/workflows/`.

## Technical Constraints For Implementation
- Keep rule sets workflow-specific; avoid one-size-fits-all patterns.
- Preserve always-trigger coverage for `Cargo.toml`, `Cargo.lock`, `Makefile`, and `.github/workflows/**`.
- Ensure stakeholder-requested non-impacting directories (`backlog/**`, `docs/**`, `eval/**`) do not trigger unrelated workflows when changed alone.
- Favor fail-safe inclusion over aggressive exclusion to minimize false negatives.

## Interface Assumptions
- Trigger control is implemented at GitHub Actions workflow event configuration level.
- No runtime application logic or CLI interface changes are required for this item.

## Risk Notes For Handoff
- Over-filtering risk: missing mandatory CI runs on relevant changes.
- Under-filtering risk: continued CI churn with limited benefit.
- Drift risk: path rules may become stale as repository structure evolves.

## Verification
- Unit tests: N/A (workflow-configuration slice).
- Integration tests: scenario-based workflow trigger checks in PR/commit simulation.
- Evaluation checks: N/A (non-AI behavior change).

## Rollout Notes
- Requirements Engineer transitions to `ready` after Architect gate completion.
- Implementing Developer applies workflow YAML changes with explicit before/after trigger evidence in handoff notes.
