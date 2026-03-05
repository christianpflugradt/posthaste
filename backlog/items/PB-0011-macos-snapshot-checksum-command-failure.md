# PB-0011: Fix macOS snapshot checksum command failure in release-policy workflow

## Source
- Stakeholder bug report (2026-03-05): macOS snapshot step fails with `/bin/bash: sha256sum: command not found` in release-policy workflow.
- Intake brief: `docs/01-product/intake/PB-0011-macos-snapshot-checksum-command-failure.md`.

## Parent Link
- PB-0008

## Problem Statement
Snapshot workflow currently uses a checksum command unavailable on macOS runners, causing job failure and reducing release pipeline reliability.

## Desired Outcome
macOS snapshot workflow succeeds and emits valid checksum output with platform-compatible command logic.

## Vision Alignment
- High.

## Priority
- P2.

## Story Points
- 2

## Status
- shaped.

## Role Gate Matrix
| Role | State | Updated | Notes |
| --- | --- | --- | --- |
| Product Owner | done | 2026-03-05 | Intake framing, urgent prioritization, and RE handoff completed. |
| Architect | pending | 2026-03-05 | Not started. |
| Requirements Engineer | pending | 2026-03-05 | Next: refine portable checksum behavior and acceptance criteria. |
| Quality Engineer | pending | 2026-03-05 | Not started. |
| Security Engineer | pending | 2026-03-05 | Not started. |
| Implementing Developer | pending | 2026-03-05 | Not started. |
| Reviewing Developer | pending | 2026-03-05 | Not started. |

## Constraints
- Must resolve macOS `sha256sum` command absence.
- Must preserve checksum artifact usability and avoid cross-platform regressions.
- Requirements Engineer may refine checksum output normalization requirements per workflow target.

## Recommendation
- Proceed.

## Acceptance Signal
- macOS snapshot job no longer fails due missing checksum command.
- Checksum artifact output remains valid for downstream use.

## Handoff Target
- Product Owner -> Requirements Engineer + Architect.

## Blocking Conditions
- Requires Architect gate completion before Requirements Engineer can transition item to `ready`.

## Issue Comment Log
| Time | Role | Type | Note | Status Impact |
| --- | --- | --- | --- | --- |
| 2026-03-05 16:17 | Product Owner | status | Captured stakeholder-reported macOS snapshot checksum failure and created PB-0011 linked to PB-0008. | Product Owner: in-progress |
| 2026-03-05 16:17 | Product Owner | decision | Prioritized PB-0011 as highest-priority P0 due repeated release workflow failure impact; added override decision DEC-0002. | None |
| 2026-03-05 16:17 | Product Owner | status | Completed intake framing and transitioned PB-0011 from `intake` to `shaped`. | Product Owner: done; item status: shaped |
| 2026-03-05 16:17 | Product Owner | handoff | Handoff package ready for Requirements Engineer to refine exact portable checksum behavior and file-format expectations. | None |
| 2026-03-05 16:23 | Product Owner | decision | Re-prioritized PB-0011 from `P0` to `P2` per stakeholder risk reassessment; PB-0010 remains higher urgency. Recorded in DEC-0003. | None |
| 2026-03-05 16:23 | Product Owner | status | Reordered backlog to place PB-0011 after currently open items while preserving eligibility for future scheduling via aging-aware ordering policy. | item priority/order updated |
