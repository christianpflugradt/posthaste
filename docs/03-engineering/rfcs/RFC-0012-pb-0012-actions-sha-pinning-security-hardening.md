# RFC: PB-0012 Actions SHA Pinning Security Hardening

## Feature Name
PB-0012 security hardening by pinning GitHub Actions to commit SHAs

## Problem
Workflow actions referenced by moving tags can drift unexpectedly and increase supply-chain risk in CI/release paths.

## Proposed Solution
Define requirements for pinning in-scope GitHub Actions to immutable commit SHAs while preserving current workflow behavior and maintainable update flow.

## User Value
Contributors and operators get more reproducible and security-hardened CI/release execution.

## Scope
- In scope:
  - Pinning all in-scope workflow action references to commit SHAs.
  - Defining update policy and ownership for pin refresh.
  - Preserving current behavior except security hardening.
- Out of scope:
  - Replacing GitHub Actions ecosystem.
  - Paid tooling dependency introduction.
  - Broad workflow redesign unrelated to pinning.

## Functional Requirements
- FR-001: In-scope `.github/workflows/*.yml` action references use immutable commit SHAs rather than moving tags.
- FR-002: Workflow behavior remains functionally equivalent after pinning.
- FR-003: A documented pin refresh policy is defined (default monthly cadence).
- FR-004: Pin refresh automation is tracked as separate follow-up backlog work, not required in this slice.

## Non-Functional Requirements
- NFR-001: Pin strategy must be auditable and deterministic.
- NFR-002: Maintenance overhead remains bounded via explicit cadence/ownership.
- NFR-003: Requirements and AC trace to PB-0012 intake and security-hardening intent.

## Architecture Constraints and Interface Assumptions
- Workflow action references are the architecture boundary for this hardening slice.
- All in-scope action references must use immutable commit SHAs; mixed tag/SHA state is out of policy.
- Hardening must not alter workflow intent or required gate semantics defined in prior ADRs.
- Policy governance is recorded in ADR-011.

## Assumptions
- Assumption A1: Pin refresh uses fixed monthly cadence by default.
- Assumption A2: Pin refresh automation is deferred to a dedicated follow-up item.

## Acceptance Criteria
- AC-001: Requirements explicitly define pinning scope and immutable reference expectations.
- AC-002: Requirements define behavior-preservation expectations and update policy.
- AC-003: Verification mapping and traceability are complete for implementation handoff.

## Verification Intent Mapping
| Acceptance Criterion | Verification Intent |
| --- | --- |
| AC-001 | Workflow review confirms SHA-pinned references for in-scope actions. |
| AC-002 | CI run evidence confirms no unintended behavior regressions after pinning. |
| AC-003 | Traceability review confirms PB-0012 mapping from intake -> RFC -> planned validation. |

## Requirement Traceability Notes
| Requirement | Traceability |
| --- | --- |
| FR-001, NFR-001 | PB-0012 intake problem/desired outcome |
| FR-002 | PB-0012 constraint to preserve behavior |
| FR-003, A1 | PB-0012 intake question on refresh cadence |
| FR-004, A2 | PB-0012 intake question on automation follow-up |
| NFR-003, AC-003 | PB-0012 backlog item and issue log |

## Architect Handoff Notes
- Implementation constraints are captured in `docs/03-engineering/implementation-plans/PLAN-0012-pb-0012-actions-sha-pinning-security-hardening.md`.
- Architecture-impacting policy decision is captured in ADR-011.
