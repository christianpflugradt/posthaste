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
- ready.

## Role Gate Matrix
| Role | State | Updated | Notes |
| --- | --- | --- | --- |
| Product Owner | done | 2026-03-05 | Intake framing and handoff completed. |
| Architect | done | 2026-03-05 | Matrix and no-cross decision defined. |
| Requirements Engineer | done | 2026-03-05 | Requirements package completed in RFC-0006 with FR/NFR, acceptance criteria, verification mapping, and traceability notes. |
| Quality Engineer | pending | 2026-03-05 | Not started. |
| Security Engineer | pending | 2026-03-05 | Not started. |
| Implementing Developer | pending | 2026-03-05 | Not started. |
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
