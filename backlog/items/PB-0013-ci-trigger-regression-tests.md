# PB-0013: CI trigger regression tests for workflow path filtering

## Source
- Product Owner follow-up (2026-03-05): protect PB-0010 trigger filtering behavior with explicit regression checks.
- Intake brief: `docs/01-product/intake/PB-0013-ci-trigger-regression-tests.md`.

## Parent Link
- PB-0010

## Problem Statement
Trigger-path behavior can regress silently without explicit verification coverage.

## Desired Outcome
Deterministic checks validate both trigger and non-trigger path scenarios for in-scope workflows.

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
| Product Owner | done | 2026-03-05 | Intake framing and RE handoff completed. |
| Architect | done | 2026-03-06 | Trigger-regression architecture policy finalized (ADR-012) with RFC + implementation-plan handoff artifacts. |
| Requirements Engineer | done | 2026-03-05 | Requirements package completed in RFC-0013 with FR/NFR, assumptions, AC mapping, and traceability notes. |
| Quality Engineer | pending | 2026-03-05 | Not started. |
| Security Engineer | pending | 2026-03-05 | Not started. |
| Implementing Developer | done | 2026-03-06 | Implemented deterministic trigger regression checks and passed required implementation checks. |
| Reviewing Developer | pending | 2026-03-05 | Not started. |

## Constraints
- Keep checks maintainable and deterministic.
- Cover both positive and negative trigger cases.
- Avoid brittle coupling to unrelated workflow details.

## Recommendation
- Proceed.

## Acceptance Signal
- Trigger-regression checks fail on misconfigured path filters and pass on valid configuration.

## Handoff Target
- Product Owner -> Requirements Engineer + Architect.

## Blocking Conditions
- Requires Architect gate completion before Requirements Engineer can transition item to `ready`.

## Issue Comment Log
| Time | Role | Type | Note | Status Impact |
| --- | --- | --- | --- | --- |
| 2026-03-05 19:04 | Product Owner | status | Created PB-0013 as PB-0010 follow-up to prevent path-filter regressions. | Product Owner: in-progress |
| 2026-03-05 19:04 | Product Owner | status | Completed intake framing and moved PB-0013 from `intake` to `shaped`. | Product Owner: done; item status: shaped |
| 2026-03-05 19:04 | Product Owner | handoff | Handoff package ready for RE refinement of trigger-regression verification scope. | None |
| 2026-03-05 19:15 | Requirements Engineer | status | Picked up PB-0013 refinement and transitioned role gate from `pending` to `in-progress` to define deterministic trigger regression coverage. | Requirements Engineer: in-progress |
| 2026-03-05 19:15 | Requirements Engineer | decision | Resolved intake questions with minimal assumptions: use script-based fixture checks for this slice and scope verification to current workflows only. | None |
| 2026-03-05 19:15 | Requirements Engineer | status | Completed PB-0013 requirements package in `docs/03-engineering/rfcs/RFC-0013-pb-0013-ci-trigger-regression-tests.md` with explicit scope, FR/NFR, assumptions, AC mapping, and traceability. | Requirements Engineer: done |
| 2026-03-05 19:15 | Requirements Engineer | blocker | Cannot transition PB-0013 to `ready` yet because Architect gate is still `pending`; item remains `shaped` pending Architect completion. | None |
| 2026-03-06 18:48 | Architect | status | Picked up PB-0013 Architect work unit and transitioned role gate from `pending` to `in-progress` for regression-verification architecture finalization. | Architect: in-progress |
| 2026-03-06 18:48 | Architect | decision | Recorded CI trigger regression verification policy in `docs/03-engineering/decision-records/ADR-012-ci-trigger-regression-verification-strategy.md` including positive/negative scenario coverage, drift-fail semantics, and scope boundaries. | None |
| 2026-03-06 18:48 | Architect | handoff | Published architect artifacts for implementation handoff: `docs/03-engineering/rfcs/RFC-0013-pb-0013-ci-trigger-regression-tests.md` (architecture constraints/interface assumptions) and `docs/03-engineering/implementation-plans/PLAN-0013-pb-0013-ci-trigger-regression-tests.md` (task/risk/verification breakdown). | None |
| 2026-03-06 18:48 | Architect | status | Architect gate complete for PB-0013 with no unresolved architecture ambiguity; Requirements Engineer can now transition item to `ready` per ownership rules. | Architect: done |
| 2026-03-06 18:52 | Requirements Engineer | status | Confirmed Architect + Requirements Engineer gates are both `done`; resolved prior RE blocker and transitioned PB-0013 from `shaped` to `ready`. | item status: ready |
| 2026-03-06 18:56 | Implementing Developer | status | Picked up PB-0013 implementation and transitioned item from `ready` to `in-progress` per ownership policy. | Implementing Developer: in-progress; item status: in-progress |
| 2026-03-06 18:56 | Implementing Developer | handoff | Implemented deterministic trigger regression coverage via `scripts/check_ci_trigger_filters.sh` with fixture set `scripts/fixtures/ci_trigger_scenarios.tsv`; wired checks into `make check` and `qa-gates` workflow execution path. | None |
| 2026-03-06 18:56 | Implementing Developer | status | Completed implementation verification: `make check` passed and mutation proof `./scripts/check_ci_trigger_filters.sh --mutate-first` failed as expected (`exit=1`). | Implementing Developer: done |
| 2026-03-06 19:01 | Product Owner | blocker | Stakeholder bug report: QA matrix workflow fails while running `./scripts/check_ci_trigger_filters.sh` on GitHub Actions with `line 71: mapfile: command not found` (followed by `awk: i/o error` and exit code `127`). Review/rework should ensure shell portability in CI runner environment before disposition. | None |
