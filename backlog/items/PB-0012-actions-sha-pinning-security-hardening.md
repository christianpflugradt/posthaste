# PB-0012: Security hardening by pinning GitHub Actions to commit SHAs

## Source
- Product Owner follow-up (2026-03-05): reduce CI/release supply-chain risk by pinning action references to immutable SHAs.
- Intake brief: `docs/01-product/intake/PB-0012-actions-sha-pinning-security-hardening.md`.

## Parent Link
- None

## Problem Statement
Current workflow action references use moving tags, leaving CI/release behavior exposed to upstream action drift.

## Desired Outcome
All in-scope workflow actions are pinned to immutable SHAs with a clear update policy.

## Vision Alignment
- High.

## Priority
- P1.

## Story Points
- 2

## Status
- shaped.

## Role Gate Matrix
| Role | State | Updated | Notes |
| --- | --- | --- | --- |
| Product Owner | done | 2026-03-05 | Intake framing and RE handoff completed. |
| Architect | pending | 2026-03-05 | Not started. |
| Requirements Engineer | pending | 2026-03-05 | Next: define pinning scope/update policy acceptance criteria. |
| Quality Engineer | pending | 2026-03-05 | Not started. |
| Security Engineer | pending | 2026-03-05 | Not started. |
| Implementing Developer | pending | 2026-03-05 | Not started. |
| Reviewing Developer | pending | 2026-03-05 | Not started. |

## Constraints
- Preserve current workflow behavior.
- No paid tooling dependency for pin management.
- Keep updates maintainable.

## Recommendation
- Proceed.

## Acceptance Signal
- Actions are SHA-pinned and workflows still pass.

## Handoff Target
- Product Owner -> Requirements Engineer + Architect.

## Blocking Conditions
- Requires Architect gate completion before Requirements Engineer can transition item to `ready`.

## Issue Comment Log
| Time | Role | Type | Note | Status Impact |
| --- | --- | --- | --- | --- |
| 2026-03-05 19:04 | Product Owner | status | Created PB-0012 from hardening backlog planning after baseline delivery. | Product Owner: in-progress |
| 2026-03-05 19:04 | Product Owner | status | Completed intake framing and moved PB-0012 from `intake` to `shaped`. | Product Owner: done; item status: shaped |
| 2026-03-05 19:04 | Product Owner | handoff | Handoff package ready for RE refinement on action-pin scope and update policy. | None |
