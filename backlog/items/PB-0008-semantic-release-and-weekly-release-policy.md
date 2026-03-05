# PB-0008: Semantic-release and weekly release policy

## Source
- Parent item: PB-0002.
- Derived from ADR-007.
- Intake brief: `docs/01-product/intake/PB-0008-stakeholder-intake.md`.

## Parent Link
- PB-0002

## Problem Statement
Release orchestration needs automation and clear governance consistent with PO ownership and weekly cadence.

## Desired Outcome
Semantic-release workflow is integrated with:
- PO-controlled formal release timing,
- weekly release window (Sunday night to Monday),
- continuous snapshot artifact publication.

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
| Architect | done | 2026-03-05 | Orchestration policy defined in ADR-007. |
| Requirements Engineer | done | 2026-03-05 | Requirements package completed in RFC-0008 with FR/NFR, acceptance criteria, verification mapping, and traceability notes. |
| Quality Engineer | pending | 2026-03-05 | Not started. |
| Security Engineer | pending | 2026-03-05 | Not started. |
| Implementing Developer | done | 2026-03-05 | Implemented snapshot-on-main workflow plus PO-controlled semantic-release formal channel with weekly-default policy enforcement. |
| Reviewing Developer | pending | 2026-03-05 | Not started. |

## Constraints
- formal releases are not on every push.
- snapshot naming includes traceability.

## Recommendation
- Proceed.

## Acceptance Signal
- Snapshot and release channels operate according to policy.

## Handoff Target
- Product Owner -> Requirements Engineer + Architect.

## Blocking Conditions
- Requires `ready` transition by Requirements Engineer.

## Issue Comment Log
| Time | Role | Type | Note | Status Impact |
| --- | --- | --- | --- | --- |
| 2026-03-05 11:45 | Architect | status | Derived implementation slice from architecture decisions. | Architect: done |
| 2026-03-05 12:47 | Product Owner | status | Completed PB-0008 intake framing and recommendation; moved item from `intake` to `shaped`. | Product Owner: done; item status: shaped |
| 2026-03-05 12:47 | Product Owner | handoff | Handoff package ready for Requirements Engineer specification work (architectural constraints already satisfied). | None |
| 2026-03-05 15:29 | Requirements Engineer | decision | Resolved intake questions with minimal assumptions for this slice: skipped weekly windows defer by default unless PO explicitly authorizes midweek release, and snapshot publication runs on every `main` merge. Assumptions documented in RFC-0008. | None |
| 2026-03-05 15:29 | Requirements Engineer | status | Completed PB-0008 requirements package in `docs/03-engineering/rfcs/RFC-0008-pb-0008-semantic-release-and-weekly-policy.md` with explicit scope, FR/NFR set, acceptance criteria, verification intent mapping, and traceability links. | Requirements Engineer: done |
| 2026-03-05 15:29 | Requirements Engineer | status | Confirmed Architect + Requirements Engineer gates are both `done`; transitioned PB-0008 from `shaped` to `ready`. | item status: ready |
| 2026-03-05 15:37 | Implementing Developer | status | Transitioned PB-0008 from `ready` to `in-progress` and started implementation work. | item status: in-progress; Implementing Developer: in-progress |
| 2026-03-05 15:37 | Implementing Developer | handoff | Implemented release-orchestration automation artifacts: `.releaserc.json` for semver formal releases and `.github/workflows/release-policy.yml` with channel separation. Snapshot channel now runs on every `main` merge, builds native target binaries, and publishes traceable snapshot artifacts/checksums. Formal release channel is workflow-dispatch only with required PO approval input, weekly-default Sunday/Monday UTC enforcement, and explicit midweek-override mode before semantic-release execution. Validation evidence: `make check` passed. | Implementing Developer: done |
