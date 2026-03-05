# RFC: PB-0005 Rust QA Gates (fmt, clippy, test)

## Feature Name
PB-0005 Rust QA gates baseline

## Problem
Without enforced baseline QA gates, formatting drift, lint debt, and regressions can enter early and amplify downstream delivery risk.

## Proposed Solution
Define an implementation-ready requirement package for enforcing three blocking QA gates in repository and CI:
- `cargo fmt --check`
- `cargo clippy -- -D warnings`
- `cargo test`

## User Value
Contributors get consistent, deterministic quality signals and fail-fast feedback before merge/release activity.

## Scope
- In scope:
  - Mandatory enforcement of `fmt`, strict `clippy`, and `test`.
  - Deterministic gate order aligned to ADR-006.
  - Blocking behavior in CI when any required gate fails.
- Out of scope:
  - Coverage thresholds.
  - Integration/performance/scalability gate expansion.
  - Additional security scanning policy changes.
  - Broad local workflow documentation changes outside this slice.

## Functional Requirements
- FR-001: CI executes required QA gates in defined order: `fmt` then `clippy` then `test`.
- FR-002: Any required gate failure causes overall CI failure (blocking).
- FR-003: Clippy is zero-warning from first merge (`-D warnings`), with no temporary allowlist for bootstrap.
- FR-004: Repository exposes a repeatable local command sequence for running required gates before push.

## Non-Functional Requirements
- NFR-001: Gate behavior must be deterministic across supported development environments and CI runner contexts.
- NFR-002: Gate configuration remains Rust-native and open-source with no paid/proprietary tooling requirement.
- NFR-003: Requirements and AC remain traceable to PB-0005 and ADR-006.

## Technical Plan
- Configure CI and project workflow to enforce the gate trio in order.
- Keep rule set minimal and strict at baseline.
- Defer broader documentation details to PB-0009 while preserving enough local guidance for immediate use.

## Risks
- Strict clippy can initially reduce throughput if baseline code style is inconsistent.
- Environment differences may expose unexpected lint/test behavior.

## Test Plan
- Validate each gate runs and blocks on failure.
- Verify order of execution and fail-fast behavior.
- Confirm local and CI invocation parity.

## Evaluation Plan
- No AI-evaluation run required for this slice because no model behavior changes.

## Assumptions
- Assumption A1: Zero-warning clippy policy is absolute from the first merge; no temporary lint exceptions in this slice.
- Assumption A2: Full local pre-flight documentation lives primarily under PB-0009, while PB-0005 requires only minimal immediate local command guidance.

## Acceptance Criteria
- AC-001: Requirement package defines strict blocking QA gate behavior with explicit ordered execution.
- AC-002: Requirements are testable and unambiguous for implementation of CI/local enforcement.
- AC-003: Verification mapping and traceability are complete for handoff.

## Verification Intent Mapping
| Acceptance Criterion | Verification Intent |
| --- | --- |
| AC-001 | Configuration review confirms `fmt`, strict `clippy`, and `test` are required and ordered. |
| AC-002 | Implementation evidence confirms CI fails when any one required gate fails. |
| AC-003 | Traceability review confirms PB-0005 requirements map to ADR-006 and planned gate evidence. |

## Requirement Traceability Notes
| Requirement | Traceability |
| --- | --- |
| FR-001, FR-002, NFR-001 | ADR-006, PB-0005 intake brief |
| FR-003 | PB-0005 constraint: clippy warnings are blocking |
| FR-004, A2 | PB-0005 intake question on local pre-flight command order; PB-0009 doc slice boundary |
| NFR-002 | ADR-001, ADR-008 |
| NFR-003, AC-003 | PB-0005 backlog item, RFC-0001 architecture baseline |
