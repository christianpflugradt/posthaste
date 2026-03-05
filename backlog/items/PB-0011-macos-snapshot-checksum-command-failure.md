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
- in-progress.

## Role Gate Matrix
| Role | State | Updated | Notes |
| --- | --- | --- | --- |
| Product Owner | done | 2026-03-05 | Intake framing, urgent prioritization, and RE handoff completed. |
| Architect | done | 2026-03-05 | Portable checksum architecture policy finalized (ADR-010) with RFC + implementation-plan handoff artifacts. |
| Requirements Engineer | done | 2026-03-05 | Requirements package finalized in RFC-0011 with FR/NFR, assumptions, acceptance criteria mapping, and traceability notes. |
| Quality Engineer | pending | 2026-03-05 | Not started. |
| Security Engineer | pending | 2026-03-05 | Not started. |
| Implementing Developer | done | 2026-03-05 | Replaced non-portable checksum command with OS-specific Linux/macOS logic and preserved normalized output contract. |
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
| 2026-03-05 18:23 | Architect | status | Picked up PB-0011 Architect work unit and transitioned role gate from `pending` to `in-progress` for checksum portability architecture design. | Architect: in-progress |
| 2026-03-05 18:23 | Architect | decision | Recorded portable checksum architecture policy in `docs/03-engineering/decision-records/ADR-010-portable-checksum-command-strategy-ci.md` including OS-specific command strategy, normalized output contract, and failure semantics. | None |
| 2026-03-05 18:23 | Architect | handoff | Published architect artifacts for downstream work: `docs/03-engineering/rfcs/RFC-0011-pb-0011-macos-snapshot-checksum-portability.md` and `docs/03-engineering/implementation-plans/PLAN-0011-pb-0011-macos-snapshot-checksum-fix.md` with constraints, interface assumptions, and verification intent. | None |
| 2026-03-05 18:23 | Architect | status | Architect gate complete for PB-0011 with no unresolved architecture ambiguity; Requirements Engineer can proceed with refinement and `ready` transition ownership when complete. | Architect: done |
| 2026-03-05 18:29 | Requirements Engineer | status | Picked up PB-0011 refinement and transitioned role gate from `pending` to `in-progress` to finalize portable checksum requirements/verification mapping. | Requirements Engineer: in-progress |
| 2026-03-05 18:29 | Requirements Engineer | decision | Resolved intake questions with minimal-risk assumptions: checksum file format parity across OS targets is a hard requirement, and fix scope is PB-0011 snapshot path first with broader rollout as follow-up if needed. | None |
| 2026-03-05 18:29 | Requirements Engineer | status | Finalized RE requirements in `docs/03-engineering/rfcs/RFC-0011-pb-0011-macos-snapshot-checksum-portability.md` with FR/NFR, assumptions, verification intent mapping, and requirement traceability notes. | Requirements Engineer: done |
| 2026-03-05 18:29 | Requirements Engineer | status | Confirmed Architect + Requirements Engineer gates are both `done`; transitioned PB-0011 from `shaped` to `ready`. | item status: ready |
| 2026-03-05 18:36 | Implementing Developer | status | Transitioned PB-0011 from `ready` to `in-progress` and started checksum portability implementation work. | item status: in-progress; Implementing Developer: in-progress |
| 2026-03-05 18:36 | Implementing Developer | handoff | Updated `.github/workflows/release-policy.yml` checksum generation to use OS-specific native commands: Linux uses `sha256sum`, macOS uses `shasum -a 256` with normalized lower-case output formatted as `sha256  filename`; Windows path remains unchanged. Checksum generation remains hard-blocking before snapshot artifact upload. Validation evidence: `make check` passed. | Implementing Developer: done |
