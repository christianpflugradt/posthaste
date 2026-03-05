# PB-0005: Rust QA gates (fmt, clippy, test)

## Source
- Parent item: PB-0002.
- Derived from ADR-006.
- Intake brief: `docs/01-product/intake/PB-0005-stakeholder-intake.md`.

## Parent Link
- PB-0002

## Problem Statement
Quality checks must be enforced early to avoid accumulating quality debt.

## Desired Outcome
Repository and CI enforce:
- `cargo fmt --check`
- `cargo clippy -- -D warnings`
- `cargo test`

## Vision Alignment
- High.

## Priority
- P0.

## Story Points
- 2

## Status
- in-progress.

## Role Gate Matrix
| Role | State | Updated | Notes |
| --- | --- | --- | --- |
| Product Owner | done | 2026-03-05 | Intake framing and handoff completed. |
| Architect | done | 2026-03-05 | Gate ordering defined in ADR. |
| Requirements Engineer | done | 2026-03-05 | Requirements package completed in RFC-0005 with FR/NFR, acceptance criteria, verification mapping, and traceability notes. |
| Quality Engineer | pending | 2026-03-05 | Not started. |
| Security Engineer | pending | 2026-03-05 | Not started. |
| Implementing Developer | done | 2026-03-05 | Added local and CI QA gate enforcement for fmt, strict clippy, and test in required order. |
| Reviewing Developer | pending | 2026-03-05 | Not started. |

## Constraints
- Clippy warnings are blocking.

## Recommendation
- Proceed.

## Acceptance Signal
- CI fails when any required QA gate fails.

## Handoff Target
- Product Owner -> Requirements Engineer + Architect.

## Blocking Conditions
- Requires `ready` transition by Requirements Engineer.

## Issue Comment Log
| Time | Role | Type | Note | Status Impact |
| --- | --- | --- | --- | --- |
| 2026-03-05 11:45 | Architect | status | Derived implementation slice from architecture decisions. | Architect: done |
| 2026-03-05 12:25 | Product Owner | status | Completed PB-0005 intake framing and recommendation; moved item from `intake` to `shaped`. | Product Owner: done; item status: shaped |
| 2026-03-05 12:25 | Product Owner | handoff | Handoff package ready for Requirements Engineer specification work (architectural constraints already satisfied). | None |
| 2026-03-05 13:08 | Requirements Engineer | decision | Resolved intake questions with minimal assumptions for this slice: clippy zero-warning policy is absolute from first merge, and broad local pre-flight documentation is primarily handled under PB-0009 with minimal immediate guidance captured in PB-0005 requirements. | None |
| 2026-03-05 13:08 | Requirements Engineer | status | Completed PB-0005 requirements package in `docs/03-engineering/rfcs/RFC-0005-pb-0005-rust-qa-gates.md` with explicit scope, FR/NFR set, acceptance criteria, verification intent mapping, and traceability links. | Requirements Engineer: done |
| 2026-03-05 13:08 | Requirements Engineer | status | Confirmed Architect + Requirements Engineer gates are both `done`; transitioned PB-0005 from `shaped` to `ready`. | item status: ready |
| 2026-03-05 13:52 | Implementing Developer | status | Transitioned PB-0005 from `ready` to `in-progress` and started implementation work. | item status: in-progress; Implementing Developer: in-progress |
| 2026-03-05 13:52 | Implementing Developer | handoff | Implemented QA gate enforcement artifacts: `Makefile` (`check` runs `fmt -> clippy -> test`) and `.github/workflows/qa-gates.yml` with ordered blocking steps (`cargo fmt --check`, `cargo clippy -- -D warnings`, `cargo test`) on push/PR. Evidence package for QE/Security: local gate run `make check` passed; no dependency additions required. | Implementing Developer: done |
