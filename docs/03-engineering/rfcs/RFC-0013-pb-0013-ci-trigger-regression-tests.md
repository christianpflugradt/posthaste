# RFC: PB-0013 CI Trigger Regression Tests

## Feature Name
PB-0013 CI trigger regression tests for workflow path filtering

## Problem
Without explicit verification checks, trigger-path filtering behavior can regress and either reintroduce redundant runs or suppress required runs.

## Proposed Solution
Define deterministic regression-check requirements covering both trigger and non-trigger path scenarios for in-scope workflows.

## User Value
Workflow trigger changes become safer and auditable with clear pass/fail signals before merge.

## Scope
- In scope:
  - Regression checks for positive (should trigger) and negative (should not trigger) path scenarios.
  - Verification strategy scoped to current in-scope workflows and path-filter policies.
  - Maintainable fixtures/scripts that avoid fragile coupling.
- Out of scope:
  - Full GitHub Actions emulation.
  - Runtime test-surface expansion unrelated to trigger behavior.

## Functional Requirements
- FR-001: Regression checks cover at least one deterministic scenario per workflow for `should trigger`.
- FR-002: Regression checks cover at least one deterministic scenario per workflow for `should not trigger`.
- FR-003: Checks fail when trigger configuration drifts from expected path-filter behavior.
- FR-004: Verification approach uses script-based fixture checks for this slice.
- FR-005: Scope is current workflows only; template-level future-workflow coverage can be follow-up.

## Non-Functional Requirements
- NFR-001: Checks are deterministic and maintainable with minimal brittle assumptions.
- NFR-002: Verification artifacts are simple to review and update alongside workflow changes.
- NFR-003: Requirements and AC are traceable to PB-0013 and PB-0010 trigger-policy intent.

## Architecture Constraints and Interface Assumptions
- Trigger regression verification must remain script-and-fixture based in this slice.
- Verification boundary is workflow trigger configuration behavior; runtime application behavior is out of scope.
- Each in-scope workflow must have explicit positive and negative scenario coverage.
- Strategy governance is defined by ADR-012 and aligned with ADR-009 path-scoping policy.

## Assumptions
- Assumption A1: Use script-based fixture checks (not new external linter/tool) in this slice.
- Assumption A2: Verification scope is current workflows only.

## Acceptance Criteria
- AC-001: Requirements explicitly define positive and negative trigger regression coverage.
- AC-002: Requirements define deterministic failure behavior on path-filter misconfiguration.
- AC-003: Verification mapping and traceability are complete for implementation handoff.

## Verification Intent Mapping
| Acceptance Criterion | Verification Intent |
| --- | --- |
| AC-001 | Fixture/check inventory confirms both trigger and non-trigger scenarios are represented. |
| AC-002 | Negative test mutation confirms checks fail on misconfigured trigger rules. |
| AC-003 | Traceability review confirms PB-0013 mapping from intake -> RFC -> planned check evidence. |

## Requirement Traceability Notes
| Requirement | Traceability |
| --- | --- |
| FR-001, FR-002 | PB-0013 intake quality constraint (cover both should/should-not trigger paths) |
| FR-003, NFR-001 | PB-0013 problem statement and success signal |
| FR-004, A1 | PB-0013 intake question on script fixtures vs dedicated tool |
| FR-005, A2 | PB-0013 intake question on current vs template workflow scope |
| NFR-003, AC-003 | PB-0013 parent link to PB-0010 and backlog-item handoff requirements |

## Architect Handoff Notes
- Implementation constraints and risk notes are captured in `docs/03-engineering/implementation-plans/PLAN-0013-pb-0013-ci-trigger-regression-tests.md`.
- Architecture-impacting verification policy decision is captured in ADR-012.
