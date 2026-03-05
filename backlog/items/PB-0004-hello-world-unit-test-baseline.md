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
- shaped.

## Role Gate Matrix
| Role | State | Updated | Notes |
| --- | --- | --- | --- |
| Product Owner | done | 2026-03-05 | Intake framing and handoff completed. |
| Architect | done | 2026-03-05 | Test baseline decision exists. |
| Requirements Engineer | pending | 2026-03-05 | Not started. |
| Quality Engineer | pending | 2026-03-05 | Not started. |
| Security Engineer | pending | 2026-03-05 | Not started. |
| Implementing Developer | pending | 2026-03-05 | Not started. |
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
