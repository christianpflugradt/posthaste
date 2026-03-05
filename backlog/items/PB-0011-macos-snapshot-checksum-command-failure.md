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
- review.

## Role Gate Matrix
| Role | State | Updated | Notes |
| --- | --- | --- | --- |
| Product Owner | done | 2026-03-05 | Intake framing, urgent prioritization, and RE handoff completed. |
| Architect | done | 2026-03-05 | Portable checksum architecture policy finalized (ADR-010) with RFC + implementation-plan handoff artifacts. |
| Requirements Engineer | done | 2026-03-05 | Requirements package finalized in RFC-0011 with FR/NFR, assumptions, acceptance criteria mapping, and traceability notes. |
| Quality Engineer | done | 2026-03-05 | Quality gate pass: macOS-compatible checksum generation fix is validated with normalized cross-platform output contract preserved. |
| Security Engineer | done | 2026-03-05 | Security gate pass; checksum portability fix introduces no blocking security findings. |
| Implementing Developer | done | 2026-03-05 | Replaced non-portable checksum command with OS-specific Linux/macOS logic and preserved normalized output contract. |
| Reviewing Developer | done | 2026-03-05 | Review completed with approved disposition; no findings. |

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
| 2026-03-05 18:42 | Security Engineer | status | Started Security Engineer gate evaluation for PB-0011 from pending state; reviewed RFC-0011 scope, checksum step changes in `.github/workflows/release-policy.yml`, and independent local verification evidence (`make check`). | Security Engineer: in-progress |
| 2026-03-05 18:42 | Security Engineer | decision | Security findings summary: `none`. Security gate decision: `pass`. Evidence: OS-specific checksum commands remove macOS tool-availability failure without broadening privileges or dependency surface, checksum output normalization maintains stable verification contract, and checksum generation remains blocking before artifact upload. Residual low risk: third-party action supply-chain exposure via version-tag references remains and should be hardened with commit-SHA pinning in follow-up work. | Security Engineer: done |
| 2026-03-05 18:43 | Quality Engineer | status | Started QE gate evaluation for PB-0011 from pending state; validated RFC-0011 acceptance intent against workflow checksum-step implementation and independent local parity evidence. | Quality Engineer: in-progress |
| 2026-03-05 18:43 | Quality Engineer | decision | Quality gate decision: `pass`. Independent verification passed via `make check`, and workflow inspection confirms macOS checksum generation now uses native `shasum -a 256` with normalized lower-case `sha256  filename` output, while Linux/Windows branches preserve expected behavior and checksum generation remains hard-blocking before snapshot artifact upload. AI evaluation report not required because this is CI workflow portability infrastructure only. | Quality Engineer: done |
| 2026-03-05 18:43 | Quality Engineer | handoff | QE handoff to Reviewing Developer: no blocking quality evidence gaps found for PB-0011; item is quality-ready for downstream review sequencing. | None |
| 2026-03-05 18:51 | Reviewing Developer | status | Started Reviewing Developer work unit for PB-0011; transitioned item status to `review` and validated implementation, QE/Security handoff evidence, and RFC-0011 traceability. | item status: review; Reviewing Developer: in-progress |
| 2026-03-05 18:51 | Reviewing Developer | decision | Review complete with disposition `approved` and no findings (P0-P3 none). Independent verification rerun passed (`make check`), and review artifact recorded at `docs/04-quality/review-reports/PB-0011-review-report.md`. | Reviewing Developer: done |
