# PB-0007: Release artifacts and checksums

## Source
- Parent item: PB-0002.
- Derived from ADR-005, ADR-007.
- Intake brief: `docs/01-product/intake/PB-0007-stakeholder-intake.md`.

## Parent Link
- PB-0002

## Problem Statement
Users need downloadable binaries with integrity verification from day one.

## Desired Outcome
GitHub release artifacts include per-target binaries and checksum files.

## Vision Alignment
- High.

## Priority
- P0.

## Story Points
- 3

## Status
- review.

## Role Gate Matrix
| Role | State | Updated | Notes |
| --- | --- | --- | --- |
| Product Owner | done | 2026-03-05 | Intake framing and handoff completed. |
| Architect | done | 2026-03-05 | Artifact policy defined. |
| Requirements Engineer | done | 2026-03-05 | Requirements package completed in RFC-0007 with FR/NFR, acceptance criteria, verification mapping, and traceability notes. |
| Quality Engineer | done | 2026-03-05 | Quality gate pass: release workflow publishes deterministic per-target binaries, consolidated checksums, and verification instructions. |
| Security Engineer | done | 2026-03-05 | Security gate pass; release artifact/checksum workflow has no blocking security findings for current scope. |
| Implementing Developer | done | 2026-03-05 | Implemented release workflow publishing per-target binaries and consolidated checksums with verification instructions. |
| Reviewing Developer | done | 2026-03-05 | Review completed with approved disposition; no findings. |

## Constraints
- signing deferred until key-management policy exists.

## Recommendation
- Proceed.

## Acceptance Signal
- Release assets include binaries and checksums for supported targets.

## Handoff Target
- Product Owner -> Requirements Engineer + Architect.

## Blocking Conditions
- Requires `ready` transition by Requirements Engineer.

## Issue Comment Log
| Time | Role | Type | Note | Status Impact |
| --- | --- | --- | --- | --- |
| 2026-03-05 11:45 | Architect | status | Derived implementation slice from architecture decisions. | Architect: done |
| 2026-03-05 12:40 | Product Owner | status | Completed PB-0007 intake framing and recommendation; moved item from `intake` to `shaped`. | Product Owner: done; item status: shaped |
| 2026-03-05 12:40 | Product Owner | handoff | Handoff package ready for Requirements Engineer specification work (architectural constraints already satisfied). | None |
| 2026-03-05 14:59 | Requirements Engineer | decision | Resolved intake questions with minimal assumptions for this slice: publish one consolidated checksum file per release and require checksum verification instructions in release notes for MVP. Assumptions documented in RFC-0007. | None |
| 2026-03-05 14:59 | Requirements Engineer | status | Completed PB-0007 requirements package in `docs/03-engineering/rfcs/RFC-0007-pb-0007-release-artifacts-and-checksums.md` with explicit scope, FR/NFR set, acceptance criteria, verification intent mapping, and traceability links. | Requirements Engineer: done |
| 2026-03-05 14:59 | Requirements Engineer | status | Confirmed Architect + Requirements Engineer gates are both `done`; transitioned PB-0007 from `shaped` to `ready`. | item status: ready |
| 2026-03-05 15:09 | Implementing Developer | status | Transitioned PB-0007 from `ready` to `in-progress` and started implementation work. | item status: in-progress; Implementing Developer: in-progress |
| 2026-03-05 15:09 | Implementing Developer | handoff | Implemented release artifact pipeline in `.github/workflows/release-artifacts.yml`: native matrix release builds for Linux x86_64, Windows x86_64, and macOS arm64; deterministic per-target binary names; consolidated `checksums.txt`; and GitHub release publication with checksum verification instructions in release notes. Signing remains intentionally absent per policy. Validation evidence: `make check` passed. | Implementing Developer: done |
| 2026-03-05 15:34 | Quality Engineer | status | Started QE gate evaluation for PB-0007 from pending state; validated RFC-0007 acceptance intent against release workflow implementation and independent local verification evidence. | Quality Engineer: in-progress |
| 2026-03-05 15:34 | Quality Engineer | decision | Quality gate decision: `pass`. Independent evidence passed via `make check`; workflow inspection confirms per-target release binaries (Linux x86_64, Windows x86_64, macOS arm64), deterministic target naming, consolidated `checksums.txt` generation over all release assets, and explicit checksum verification instructions in release notes. No signing step is present, matching deferred-signing policy constraints. AI evaluation report not required because this slice changes release packaging infrastructure, not AI behavior. | Quality Engineer: done |
| 2026-03-05 15:34 | Quality Engineer | handoff | QE handoff to Reviewing Developer: no blocking quality evidence gaps found for PB-0007; item is quality-ready for downstream security/review sequencing. | None |
| 2026-03-05 15:53 | Quality Engineer | status | In-order `go` check against `Next Eligible Role(s)`: PB-0007 currently lists `Security Engineer`, so no QE action is eligible; proceeding to next backlog item. | None |
| 2026-03-05 18:21 | Security Engineer | status | Started Security Engineer gate evaluation for PB-0007 from pending state; reviewed RFC-0007 scope, `.github/workflows/release-artifacts.yml`, and independent local verification evidence (`make check`). | Security Engineer: in-progress |
| 2026-03-05 18:21 | Security Engineer | decision | Security findings summary: `none`. Security gate decision: `pass`. Evidence: release workflow publishes deterministic per-target artifacts with consolidated checksums, does not add runtime dependencies, and scopes write permissions only to release publication job. Residual risks: artifact signing is intentionally deferred per policy (known integrity tradeoff), and third-party GitHub Action supply-chain exposure via version-tag references (`actions/*`, `softprops/action-gh-release`, `dtolnay/rust-toolchain`) remains; recommend follow-up hardening with key-management/signing and commit-SHA pinning. | Security Engineer: done |
| 2026-03-05 18:39 | Reviewing Developer | status | Started Reviewing Developer work unit for PB-0007; transitioned item status to `review` and validated implementation, QE/Security handoff evidence, and RFC-0007 traceability. | item status: review; Reviewing Developer: in-progress |
| 2026-03-05 18:39 | Reviewing Developer | decision | Review complete with disposition `approved` and no findings (P0-P3 none). Independent verification rerun passed (`make check`), and review artifact recorded at `docs/04-quality/review-reports/PB-0007-review-report.md`. | Reviewing Developer: done |
