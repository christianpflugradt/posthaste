# PB-0004: Hello-world unit test baseline

## Source
- Parent item: PB-0002.
- Derived from ADR-006.
- Intake brief: `docs/01-product/intake/PB-0004-stakeholder-intake.md`.

## Parent Link
- PB-0002

## Problem Statement
MVP needs repeatable correctness checks with unit-test-first baseline.

## Desired Outcome
At least one meaningful unit test exists for the hello-world baseline and passes in CI.

## Vision Alignment
- High.

## Priority
- P0.

## Story Points
- 1

## Status
- in-progress.

## Role Gate Matrix
| Role | State | Updated | Notes |
| --- | --- | --- | --- |
| Product Owner | done | 2026-03-05 | Intake framing and handoff completed. |
| Architect | done | 2026-03-05 | Test baseline decision exists. |
| Requirements Engineer | done | 2026-03-05 | Requirements package completed in RFC-0004 with FR/NFR, acceptance criteria, verification mapping, and traceability notes. |
| Quality Engineer | pending | 2026-03-05 | Not started. |
| Security Engineer | pending | 2026-03-05 | Not started. |
| Implementing Developer | done | 2026-03-05 | Added deterministic hello-world success/failure unit-test baseline and validated Rust quality gates. |
| Reviewing Developer | pending | 2026-03-05 | Not started. |

## Constraints
- unit tests only for baseline.

## Recommendation
- Proceed.

## Acceptance Signal
- Unit test executes and passes in local and CI runs.

## Handoff Target
- Product Owner -> Requirements Engineer + Architect.

## Blocking Conditions
- Requires `ready` transition by Requirements Engineer.

## Issue Comment Log
| Time | Role | Type | Note | Status Impact |
| --- | --- | --- | --- | --- |
| 2026-03-05 11:45 | Architect | status | Derived implementation slice from architecture decisions. | Architect: done |
| 2026-03-05 12:22 | Product Owner | status | Completed PB-0004 intake framing and recommendation; moved item from `intake` to `shaped`. | Product Owner: done; item status: shaped |
| 2026-03-05 12:22 | Product Owner | handoff | Handoff package ready for Requirements Engineer specification work (architectural constraints already satisfied). | None |
| 2026-03-05 13:05 | Requirements Engineer | decision | Resolved intake questions with minimal assumptions for this slice: include one positive-path and one failure-path assertion, and set basic naming/module conventions now for early consistency. Assumptions documented in RFC-0004. | None |
| 2026-03-05 13:05 | Requirements Engineer | status | Completed PB-0004 requirements package in `docs/03-engineering/rfcs/RFC-0004-pb-0004-hello-world-unit-test-baseline.md` with explicit scope, FR/NFR set, acceptance criteria, verification intent mapping, and traceability links. | Requirements Engineer: done |
| 2026-03-05 13:05 | Requirements Engineer | status | Confirmed Architect + Requirements Engineer gates are both `done`; transitioned PB-0004 from `shaped` to `ready`. | item status: ready |
| 2026-03-05 13:47 | Implementing Developer | status | Transitioned PB-0004 from `ready` to `in-progress` and started implementation work. | item status: in-progress; Implementing Developer: in-progress |
| 2026-03-05 13:47 | Implementing Developer | handoff | Implemented PB-0004 unit-test baseline in `src/main.rs` by introducing deterministic argument dispatch tests for hello-world success path (`parse_args_no_arg_path_is_hello_success`) and failure path (`parse_args_rejects_extra_arguments`), while keeping tests unit-level only. Evidence package for QE/Security: `cargo fmt --check`, `cargo clippy -- -D warnings`, and `cargo test` all passed; no dependency additions. | Implementing Developer: done |
