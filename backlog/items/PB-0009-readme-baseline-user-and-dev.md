# PB-0009: README baseline for users and developers

## Source
- Parent item: PB-0002.
- Derived from Step-3 delivery expectations.
- Intake brief: `docs/01-product/intake/PB-0009-stakeholder-intake.md`.

## Parent Link
- PB-0002

## Problem Statement
Early adopters and contributors need clear usage and development instructions.

## Desired Outcome
README includes:
- user quick start,
- development setup,
- CI/QA commands,
- release/snapshot overview.

## Vision Alignment
- High.

## Priority
- P1.

## Story Points
- 2

## Status
- in-progress.

## Role Gate Matrix
| Role | State | Updated | Notes |
| --- | --- | --- | --- |
| Product Owner | done | 2026-03-05 | Intake framing and handoff completed. |
| Architect | done | 2026-03-05 | Content scope identified. |
| Requirements Engineer | done | 2026-03-05 | Requirements package completed in RFC-0009 with FR/NFR, acceptance criteria, verification mapping, and traceability notes. |
| Quality Engineer | pending | 2026-03-05 | Not started. |
| Security Engineer | pending | 2026-03-05 | Not started. |
| Implementing Developer | done | 2026-03-05 | Updated README with user-first quick start, contributor setup, QA pre-flight, and release channel overview links. |
| Reviewing Developer | pending | 2026-03-05 | Not started. |

## Constraints
- markdown-only doc work can run outside explicit backlog, but item is kept for delivery visibility.

## Recommendation
- Proceed.

## Acceptance Signal
- Stakeholder confirms README is sufficient for first user and contributor experience.

## Handoff Target
- Product Owner -> Requirements Engineer + Architect.

## Blocking Conditions
- none.

## Issue Comment Log
| Time | Role | Type | Note | Status Impact |
| --- | --- | --- | --- | --- |
| 2026-03-05 11:45 | Architect | status | Derived documentation slice from architecture and delivery expectations. | Architect: done |
| 2026-03-05 13:00 | Product Owner | status | Completed PB-0009 intake framing and recommendation; moved item from `intake` to `shaped`. | Product Owner: done; item status: shaped |
| 2026-03-05 13:00 | Product Owner | handoff | Handoff package ready for Requirements Engineer specification work (architectural constraints already satisfied). | None |
| 2026-03-05 15:30 | Requirements Engineer | decision | Resolved intake questions with minimal assumptions for this slice: README section order prioritizes end-user quick start before contributor setup, and release policy is summarized briefly with links to detailed docs. Assumptions documented in RFC-0009. | None |
| 2026-03-05 15:30 | Requirements Engineer | status | Completed PB-0009 requirements package in `docs/03-engineering/rfcs/RFC-0009-pb-0009-readme-baseline.md` with explicit scope, FR/NFR set, acceptance criteria, verification intent mapping, and traceability links. | Requirements Engineer: done |
| 2026-03-05 15:30 | Requirements Engineer | status | Confirmed Architect + Requirements Engineer gates are both `done`; transitioned PB-0009 from `shaped` to `ready`. | item status: ready |
| 2026-03-05 18:28 | Implementing Developer | status | Transitioned PB-0009 from `ready` to `in-progress` and started README implementation work. | item status: in-progress; Implementing Developer: in-progress |
| 2026-03-05 18:28 | Implementing Developer | handoff | Updated `README.md` to satisfy PB-0009 scope: user quick start, contributor setup, required QA command order, and concise snapshot/formal release overview with links to detailed governance docs. Validation evidence: `make check` passed and command examples align with current CLI/CI baseline. No code/runtime changes and no dependencies added. | Implementing Developer: done |
