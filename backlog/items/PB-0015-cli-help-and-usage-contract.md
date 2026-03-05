# PB-0015: CLI `--help` and usage/error contract baseline

## Source
- Product Owner follow-up (2026-03-05): improve first-user CLI discoverability and invocation clarity.
- Intake brief: `docs/01-product/intake/PB-0015-cli-help-and-usage-contract.md`.

## Parent Link
- PB-0001

## Problem Statement
Current CLI lacks explicit help contract, increasing onboarding friction and error ambiguity.

## Desired Outcome
CLI exposes a clear `--help` path and stable usage/error semantics.

## Vision Alignment
- High.

## Priority
- P2.

## Story Points
- 2

## Status
- shaped.

## Role Gate Matrix
| Role | State | Updated | Notes |
| --- | --- | --- | --- |
| Product Owner | done | 2026-03-05 | Intake framing and RE handoff completed. |
| Architect | pending | 2026-03-05 | Not started. |
| Requirements Engineer | done | 2026-03-05 | Requirements package completed in RFC-0015 with FR/NFR, assumptions, AC mapping, and traceability notes. |
| Quality Engineer | pending | 2026-03-05 | Not started. |
| Security Engineer | pending | 2026-03-05 | Not started. |
| Implementing Developer | pending | 2026-03-05 | Not started. |
| Reviewing Developer | pending | 2026-03-05 | Not started. |

## Constraints
- Keep CLI behavior deterministic.
- Avoid dependency-heavy CLI frameworks unless justified.
- Align README and help text contract.

## Recommendation
- Proceed.

## Acceptance Signal
- Stakeholder confirms CLI usage discoverability is adequate for first-time users.

## Handoff Target
- Product Owner -> Requirements Engineer + Architect.

## Blocking Conditions
- Requires Architect gate completion before Requirements Engineer can transition item to `ready`.

## Issue Comment Log
| Time | Role | Type | Note | Status Impact |
| --- | --- | --- | --- | --- |
| 2026-03-05 19:04 | Product Owner | status | Created PB-0015 as UX-focused CLI baseline follow-up. | Product Owner: in-progress |
| 2026-03-05 19:04 | Product Owner | status | Completed intake framing and moved PB-0015 from `intake` to `shaped`. | Product Owner: done; item status: shaped |
| 2026-03-05 19:04 | Product Owner | handoff | Handoff package ready for RE refinement on help/usage contract scope. | None |
| 2026-03-05 19:25 | Requirements Engineer | status | Picked up PB-0015 refinement and transitioned role gate from `pending` to `in-progress` to define CLI help/usage contract requirements. | Requirements Engineer: in-progress |
| 2026-03-05 19:25 | Requirements Engineer | decision | Resolved intake questions with minimal assumptions: include `-h` alias and standard exit-code semantics now; keep help scope to concise examples plus core usage contract (full exhaustive matrix deferred). | None |
| 2026-03-05 19:25 | Requirements Engineer | status | Completed PB-0015 requirements package in `docs/03-engineering/rfcs/RFC-0015-pb-0015-cli-help-and-usage-contract.md` with explicit scope, FR/NFR, assumptions, AC mapping, and traceability. | Requirements Engineer: done |
| 2026-03-05 19:25 | Requirements Engineer | blocker | Cannot transition PB-0015 to `ready` yet because Architect gate is still `pending`; item remains `shaped` pending Architect completion. | None |
