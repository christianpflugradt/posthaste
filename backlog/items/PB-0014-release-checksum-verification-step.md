# PB-0014: Add automated checksum verification step to release workflows

## Source
- Product Owner follow-up (2026-03-05): move from checksum generation-only to generation+verification.
- Intake brief: `docs/01-product/intake/PB-0014-release-checksum-verification-step.md`.

## Parent Link
- PB-0007

## Problem Statement
Generated checksums are not fully safeguarded unless verified automatically before publish.

## Desired Outcome
Release workflows verify checksums and block publication when mismatches occur.

## Vision Alignment
- High.

## Priority
- P1.

## Story Points
- 2

## Status
- shaped.

## Role Gate Matrix
| Role | State | Updated | Notes |
| --- | --- | --- | --- |
| Product Owner | done | 2026-03-05 | Intake framing and RE handoff completed. |
| Architect | pending | 2026-03-05 | Not started. |
| Requirements Engineer | done | 2026-03-05 | Requirements package completed in RFC-0014 with FR/NFR, assumptions, AC mapping, and traceability notes. |
| Quality Engineer | pending | 2026-03-05 | Not started. |
| Security Engineer | pending | 2026-03-05 | Not started. |
| Implementing Developer | pending | 2026-03-05 | Not started. |
| Reviewing Developer | pending | 2026-03-05 | Not started. |

## Constraints
- Must support existing target matrix.
- Must fail closed on mismatch.
- Keep workflow runtime overhead reasonable.

## Recommendation
- Proceed.

## Acceptance Signal
- Verified release workflows pass on correct artifacts and fail on checksum mismatch.

## Handoff Target
- Product Owner -> Requirements Engineer + Architect.

## Blocking Conditions
- Requires Architect gate completion before Requirements Engineer can transition item to `ready`.

## Issue Comment Log
| Time | Role | Type | Note | Status Impact |
| --- | --- | --- | --- | --- |
| 2026-03-05 19:04 | Product Owner | status | Created PB-0014 to harden release integrity verification. | Product Owner: in-progress |
| 2026-03-05 19:04 | Product Owner | status | Completed intake framing and moved PB-0014 from `intake` to `shaped`. | Product Owner: done; item status: shaped |
| 2026-03-05 19:04 | Product Owner | handoff | Handoff package ready for RE refinement on checksum verification behavior. | None |
| 2026-03-05 19:15 | Requirements Engineer | status | Picked up PB-0014 refinement and transitioned role gate from `pending` to `in-progress` to define checksum verification scope/failure semantics. | Requirements Engineer: in-progress |
| 2026-03-05 19:15 | Requirements Engineer | decision | Resolved intake questions with minimal assumptions: verification scope includes both snapshots and formal releases; release-note surfacing is deferred as optional follow-up. | None |
| 2026-03-05 19:15 | Requirements Engineer | status | Completed PB-0014 requirements package in `docs/03-engineering/rfcs/RFC-0014-pb-0014-release-checksum-verification-step.md` with explicit scope, FR/NFR, assumptions, AC mapping, and traceability. | Requirements Engineer: done |
| 2026-03-05 19:15 | Requirements Engineer | blocker | Cannot transition PB-0014 to `ready` yet because Architect gate is still `pending`; item remains `shaped` pending Architect completion. | None |
