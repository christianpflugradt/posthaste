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
- ready.

## Role Gate Matrix
| Role | State | Updated | Notes |
| --- | --- | --- | --- |
| Product Owner | done | 2026-03-05 | Intake framing and handoff completed. |
| Architect | done | 2026-03-05 | Artifact policy defined. |
| Requirements Engineer | done | 2026-03-05 | Requirements package completed in RFC-0007 with FR/NFR, acceptance criteria, verification mapping, and traceability notes. |
| Quality Engineer | pending | 2026-03-05 | Not started. |
| Security Engineer | pending | 2026-03-05 | Signing deferred by policy. |
| Implementing Developer | pending | 2026-03-05 | Not started. |
| Reviewing Developer | pending | 2026-03-05 | Not started. |

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
