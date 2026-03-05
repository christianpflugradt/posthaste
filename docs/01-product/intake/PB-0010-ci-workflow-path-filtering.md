# Stakeholder Intake Brief

## Raw Stakeholder Input
For each commit, two workflows currently run unnecessarily. Workflows should run only when relevant files change; `backlog/`, `eval/`, and `docs/` should not trigger workflow runs.

## Why Now
This issue affects every push and creates repeated CI noise/cost that slows delivery feedback across all active backlog items.

## Problem Statement
Current workflow triggering is overly broad, causing redundant workflow executions on commits that change non-runtime, non-build-impacting files.

## Target User Outcome
Contributors get CI runs only when code or workflow-relevant files change, reducing unnecessary execution while preserving required validation.

## Proposed Feature Slice
Introduce path-based workflow trigger filtering so changes limited to non-impacting documentation/process/evaluation directories do not run unrelated workflows.

## Non-Goals
- Changing test scope or quality gate strictness.
- Removing critical workflow coverage for source/build/CI config changes.
- Re-architecting all workflow definitions beyond trigger criteria.

## Constraints
- Time: high-priority refinement and implementation due to per-commit impact.
- Quality: avoid false negatives where meaningful changes fail to trigger required workflows.
- Technical: start with stakeholder-specified exclusions (`backlog/`, `eval/`, `docs/`) and allow Requirements Engineer to refine exact include/exclude patterns.

## Risks and Unknowns
- Over-filtering can suppress required workflow runs for shared config/tooling files.
- Workflow relevance boundaries may differ by workflow and need explicit per-workflow mapping.

## Success Signal
Stakeholder confirms that commits touching only irrelevant paths no longer trigger unnecessary workflows, while relevant code/config changes still trigger expected workflows.

## Recommendation
- [x] Proceed to RFC
- [ ] Defer
- [ ] Reject
- [ ] Need clarification

## Questions for Stakeholder
1. Should root-level files like `Cargo.toml`, `Cargo.lock`, `Makefile`, and workflow YAML always trigger CI workflows?
2. Should workflow file edits under `.github/workflows/` always trigger all workflows or only the edited workflow?
