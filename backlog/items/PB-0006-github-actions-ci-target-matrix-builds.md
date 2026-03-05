# PB-0006: GitHub Actions CI target matrix builds

## Source
- Parent item: PB-0002.
- Derived from ADR-002, ADR-005, ADR-006.
- Intake brief: `docs/01-product/intake/PB-0006-stakeholder-intake.md`.

## Parent Link
- PB-0002

## Problem Statement
MVP requires confidence that supported target platforms can build in CI without cross-compilation helpers.

## Desired Outcome
GitHub Actions workflow builds on native runners for:
- macOS arm64
- Linux x86_64
- Windows x86_64

## Vision Alignment
- High.

## Priority
- P0.

## Story Points
- 3

## Status
- in-progress.

## Role Gate Matrix
| Role | State | Updated | Notes |
| --- | --- | --- | --- |
| Product Owner | done | 2026-03-05 | Intake framing and handoff completed. |
| Architect | done | 2026-03-05 | Matrix and no-cross decision defined. |
| Requirements Engineer | done | 2026-03-05 | Requirements package completed in RFC-0006 with FR/NFR, acceptance criteria, verification mapping, and traceability notes. |
| Quality Engineer | done | 2026-03-05 | Quality gate pass: matrix workflow enforces required native targets, ordered blocking QA gates, and per-target diagnostics retention. |
| Security Engineer | done | 2026-03-05 | Security gate pass; CI matrix workflow changes introduce no blocking security risk. |
| Implementing Developer | done | 2026-03-05 | Implemented native GitHub Actions matrix and per-target diagnostics retention with blocking QA gates. |
| Reviewing Developer | pending | 2026-03-05 | Not started. |

## Constraints
- no cross-compilation helper tooling.

## Recommendation
- Proceed.

## Acceptance Signal
- CI matrix jobs succeed on supported targets.

## Handoff Target
- Product Owner -> Requirements Engineer + Architect.

## Blocking Conditions
- Requires `ready` transition by Requirements Engineer.

## Issue Comment Log
| Time | Role | Type | Note | Status Impact |
| --- | --- | --- | --- | --- |
| 2026-03-05 11:45 | Architect | status | Derived implementation slice from architecture decisions. | Architect: done |
| 2026-03-05 12:31 | Product Owner | status | Completed PB-0006 intake framing and recommendation; moved item from `intake` to `shaped`. | Product Owner: done; item status: shaped |
| 2026-03-05 12:31 | Product Owner | handoff | Handoff package ready for Requirements Engineer specification work (architectural constraints already satisfied). | None |
| 2026-03-05 13:44 | Requirements Engineer | decision | Resolved intake questions with minimal assumptions for this slice: matrix failures are hard-blocking from bootstrap, and per-target diagnostic retention is included now for debugging. Assumptions documented in RFC-0006. | None |
| 2026-03-05 13:44 | Requirements Engineer | status | Completed PB-0006 requirements package in `docs/03-engineering/rfcs/RFC-0006-pb-0006-ci-target-matrix-builds.md` with explicit scope, FR/NFR set, acceptance criteria, verification intent mapping, and traceability links. | Requirements Engineer: done |
| 2026-03-05 13:44 | Requirements Engineer | status | Confirmed Architect + Requirements Engineer gates are both `done`; transitioned PB-0006 from `shaped` to `ready`. | item status: ready |
| 2026-03-05 13:59 | Implementing Developer | status | Transitioned PB-0006 from `ready` to `in-progress` and started implementation work. | item status: in-progress; Implementing Developer: in-progress |
| 2026-03-05 13:59 | Implementing Developer | handoff | Implemented `.github/workflows/qa-gates.yml` matrix on native GitHub-hosted runners (`ubuntu-latest`, `windows-latest`, `macos-14`) mapped to required targets (Linux x86_64, Windows x86_64, macOS arm64). Each job runs ordered blocking gates (`cargo fmt --check`, `cargo clippy -- -D warnings`, `cargo test`) and uploads per-target diagnostics artifact (`diagnostics-<target>`). Local parity evidence: `make check` passed; no cross-compilation helper tooling or new dependencies added. | Implementing Developer: done |
| 2026-03-05 15:32 | Quality Engineer | status | Started QE gate evaluation for PB-0006 from pending state; validated RFC-0006 acceptance intent against CI matrix configuration and independent local parity evidence. | Quality Engineer: in-progress |
| 2026-03-05 15:32 | Quality Engineer | decision | Quality gate decision: `pass`. Independent evidence passed via `make check`; CI configuration review confirms native matrix coverage for required targets (`ubuntu-latest` -> Linux x86_64, `windows-latest` -> Windows x86_64, `macos-14` -> macOS arm64), ordered blocking gates (`fmt`, strict `clippy`, `test`) per job, and per-target diagnostics retention (`diagnostics-<target>` artifacts). AI evaluation report not required because this slice changes CI infrastructure, not AI behavior. | Quality Engineer: done |
| 2026-03-05 15:32 | Quality Engineer | handoff | QE handoff to Reviewing Developer: no blocking quality evidence gaps found for PB-0006; item is quality-ready for downstream security/review sequencing. | None |
| 2026-03-05 15:34 | Quality Engineer | status | In-order `go` check: no additional QE action is eligible on PB-0006 because QE gate is already `done`; proceeding to next backlog item. | None |
| 2026-03-05 15:35 | Security Engineer | status | Started Security Engineer gate evaluation for PB-0006 from pending state; reviewed RFC-0006, CI matrix workflow (`.github/workflows/qa-gates.yml`), and independent local parity evidence (`make check`). | Security Engineer: in-progress |
| 2026-03-05 15:35 | Security Engineer | decision | Security findings summary: `none`. Security gate decision: `pass`. Evidence: workflow introduces no new runtime dependencies or secret-handling paths, matrix jobs run non-privileged deterministic checks (`fmt`, strict `clippy`, `test`), and diagnostics artifacts are metadata-only (runner/toolchain details) with short retention. Residual low risk: third-party GitHub Action supply-chain exposure remains (`actions/*` and `dtolnay/rust-toolchain` version tags) and should be hardened with commit-SHA pinning in a follow-up security item. | Security Engineer: done |
