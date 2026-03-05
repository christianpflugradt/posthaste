# RFC: PB-0010 CI Workflow Trigger Path Filtering

## Feature Name
PB-0010 CI workflow trigger path filtering to stop redundant runs

## Problem
Current workflow triggers are overly broad and execute CI on commits that only change non-impacting directories, creating avoidable noise and slower feedback.

## Proposed Solution
Define implementation-ready requirements for per-workflow path filtering so irrelevant directory-only changes do not trigger unrelated workflows while preserving required CI coverage for code/build/config changes.

## User Value
Contributors receive higher-signal CI feedback with fewer redundant runs and lower workflow churn.

## Scope
- In scope:
  - Trigger path relevance boundaries for workflows affected by this issue.
  - Stakeholder-specified exclusion intent for `backlog/`, `eval/`, and `docs/`.
  - Explicit always-trigger rules for high-risk root/build/workflow config files.
  - Acceptance criteria for false-positive reduction without false-negative coverage gaps.
- Out of scope:
  - Changes to test scope or quality-gate strictness.
  - Full workflow architecture redesign beyond trigger rules.
  - Broader CI policy changes unrelated to trigger relevance.

## Functional Requirements
- FR-001: Workflow triggers must not run when a commit changes only irrelevant paths (`backlog/**`, `eval/**`, `docs/**`) and no relevant files are modified.
- FR-002: Source/build/CI-relevant changes must continue to trigger expected workflows.
- FR-003: Root-level files affecting build or validation (`Cargo.toml`, `Cargo.lock`, `Makefile`) always trigger CI workflows covered by this slice.
- FR-004: Edits under `.github/workflows/**` trigger all workflows covered by this slice to prevent config drift.
- FR-005: Trigger filters are defined per workflow so relevance boundaries are explicit and reviewable.

## Non-Functional Requirements
- NFR-001: Trigger behavior must minimize false negatives (missing required runs) over false positives.
- NFR-002: Trigger rules must be deterministic and easy to audit in workflow YAML.
- NFR-003: Requirements and acceptance criteria remain traceable to PB-0010 intake and decision record DEC-0001.

## Technical Plan
- Map each targeted workflow to relevant path categories.
- Add include/exclude trigger rules with explicit always-trigger exceptions.
- Validate behavior with representative change-set scenarios.

## Architecture Constraints and Interface Assumptions
- Trigger filtering must be defined per workflow and reviewed as part of workflow architecture, not hidden in ad hoc scripts.
- Workflow event configuration is the contract boundary; no runtime/CLI code changes are required for this item.
- Changes to `.github/workflows/**` are treated as globally relevant to in-scope workflows.
- Trigger filtering policy is governed by ADR-009 and remains consistent with ADR-002 (GitHub platform) and ADR-006 (CI gate integrity).

## Risks
- Over-filtering can suppress required validation on meaningful changes.
- Under-filtering can leave CI churn mostly unchanged.

## Test Plan
- Validate no-run behavior for commits changing only excluded directories.
- Validate trigger behavior for source/build/root config and workflow-file edits.
- Validate per-workflow relevance mapping against expected execution matrix.

## Evaluation Plan
- No AI-evaluation run required for this CI-trigger configuration slice.

## Assumptions
- Assumption A1: Root-level build/config files (`Cargo.toml`, `Cargo.lock`, `Makefile`) always trigger workflows in scope.
- Assumption A2: Workflow file edits under `.github/workflows/**` trigger all workflows in scope.

## Acceptance Criteria
- AC-001: Requirements define explicit relevant/irrelevant path boundaries and always-trigger exceptions.
- AC-002: Requirements preserve coverage for source/build/CI-relevant changes while suppressing irrelevant-directory-only runs.
- AC-003: Verification mapping and traceability are complete for implementation handoff.

## Verification Intent Mapping
| Acceptance Criterion | Verification Intent |
| --- | --- |
| AC-001 | Workflow trigger config review confirms excluded directories, include rules, and always-trigger exceptions are explicit. |
| AC-002 | Scenario-based checks confirm irrelevant-only commits do not run workflows while relevant/config changes do. |
| AC-003 | Traceability review confirms PB-0010 requirements link to intake constraints and DEC-0001 override context. |

## Requirement Traceability Notes
| Requirement | Traceability |
| --- | --- |
| FR-001, FR-002, NFR-001 | PB-0010 intake brief and backlog item acceptance signal |
| FR-003, A1 | PB-0010 intake open question on root-level trigger behavior |
| FR-004, A2 | PB-0010 intake open question on `.github/workflows/` behavior |
| FR-005, NFR-002 | PB-0010 constraint: RE refines exact per-workflow trigger patterns |
| NFR-003, AC-003 | PB-0010 backlog item, DEC-0001 priority override decision |

## Architect Handoff Notes
- Implementation constraints are documented in `docs/03-engineering/implementation-plans/PLAN-0010-pb-0010-ci-workflow-trigger-path-filtering.md`.
- Architecture-impacting trigger policy is recorded in ADR-009.
