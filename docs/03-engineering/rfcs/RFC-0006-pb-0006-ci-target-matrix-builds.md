# RFC: PB-0006 GitHub Actions CI Target Matrix Builds

## Feature Name
PB-0006 GitHub Actions CI target matrix builds

## Problem
Without native-target matrix CI validation, platform-specific build failures can remain hidden until late stages and reduce release confidence.

## Proposed Solution
Define implementation-ready requirements for GitHub Actions matrix builds on native runners for:
- macOS arm64
- Linux x86_64
- Windows x86_64

with blocking failure behavior and ADR-aligned QA gate execution.

## User Value
Contributors and stakeholder gain early, repeatable confidence that supported targets compile on every change.

## Scope
- In scope:
  - Native-runner matrix jobs for the three approved targets.
  - Blocking merge signal when any required target build fails.
  - ADR-006 gate order execution within matrix jobs.
- Out of scope:
  - Cross-compilation helper tooling.
  - Additional platform targets.
  - Artifact signing pipeline.
  - Long-term release artifact policy details beyond debugging retention.

## Functional Requirements
- FR-001: CI workflow runs matrix jobs on native GitHub-hosted runners for macOS arm64, Linux x86_64, and Windows x86_64.
- FR-002: Matrix failures are hard-blocking from first merge; no temporary soft-fail mode in this slice.
- FR-003: Each matrix job runs required QA gates in project order (`cargo fmt --check`, `cargo clippy -- -D warnings`, `cargo test`).
- FR-004: Workflow emits per-target logs and retains per-target build diagnostics/artifacts for debugging in this slice.

## Non-Functional Requirements
- NFR-001: Matrix execution must be deterministic and reproducible within GitHub-hosted runner environments.
- NFR-002: CI implementation remains GitHub-native and avoids cross-compilation helper dependencies.
- NFR-003: Requirements and acceptance criteria remain traceable to PB-0006 and ADR-002/ADR-005/ADR-006.

## Technical Plan
- Define matrix strategy in GitHub Actions using approved OS/arch combinations.
- Reuse Rust-native build/test commands across jobs with platform-appropriate shell handling.
- Preserve fail-fast semantics and actionable diagnostics.

## Risks
- Runner-image drift can introduce intermittent failures.
- Windows shell differences can cause command portability issues.

## Test Plan
- Validate all matrix jobs trigger and execute in expected order.
- Inject/observe failure behavior to confirm hard-blocking semantics.
- Confirm diagnostic retention for each target.

## Evaluation Plan
- No AI evaluation run required for this slice because no AI behavior changes.

## Assumptions
- Assumption A1: Matrix failures block merges immediately from bootstrap.
- Assumption A2: Per-target diagnostics/artifact retention is included now for debugging efficiency.

## Acceptance Criteria
- AC-001: Requirement package explicitly defines supported matrix targets and hard-blocking behavior.
- AC-002: Gate ordering and execution expectations are testable and unambiguous across matrix jobs.
- AC-003: Verification intent and traceability are complete for implementation handoff.

## Verification Intent Mapping
| Acceptance Criterion | Verification Intent |
| --- | --- |
| AC-001 | Workflow/config inspection confirms all required target jobs exist and failures block merge status. |
| AC-002 | CI evidence confirms each job runs `fmt`, strict `clippy`, and `test` in required order. |
| AC-003 | Traceability review confirms PB-0006 requirements map to ADR-002/005/006 and planned CI evidence. |

## Requirement Traceability Notes
| Requirement | Traceability |
| --- | --- |
| FR-001, NFR-002 | ADR-002, ADR-005, PB-0006 intake |
| FR-002, FR-003, NFR-001 | ADR-006, PB-0006 constraints |
| FR-004, A2 | PB-0006 intake question on per-target debugging retention |
| NFR-003, AC-003 | PB-0006 backlog item, RFC-0001 architecture baseline |
