# PB-0010: CI workflow trigger path filtering to stop redundant runs

## Source
- Stakeholder request (2026-03-05): workflow runs should trigger only for relevant file changes; `backlog/`, `eval/`, and `docs/` changes should not trigger unnecessary workflow runs.
- Intake brief: `docs/01-product/intake/PB-0010-ci-workflow-path-filtering.md`.

## Parent Link
- None

## Problem Statement
Two workflows run on every commit, including commits that only modify non-impacting directories, creating avoidable CI churn and slower feedback loops.

## Desired Outcome
Workflow triggers are filtered by relevant paths so non-impacting changes do not run unrelated workflows.

## Vision Alignment
- High.

## Priority
- P0.

## Story Points
- 3

## Status
- shaped.

## Role Gate Matrix
| Role | State | Updated | Notes |
| --- | --- | --- | --- |
| Product Owner | done | 2026-03-05 | Intake framing, priority override, and RE handoff completed. |
| Architect | pending | 2026-03-05 | Not started. |
| Requirements Engineer | done | 2026-03-05 | Requirements package completed in RFC-0010 with FR/NFR, acceptance criteria, verification mapping, and traceability notes. |
| Quality Engineer | pending | 2026-03-05 | Not started. |
| Security Engineer | pending | 2026-03-05 | Not started. |
| Implementing Developer | pending | 2026-03-05 | Not started. |
| Reviewing Developer | pending | 2026-03-05 | Not started. |

## Constraints
- Directory-level exclusions requested by stakeholder: `backlog/`, `eval/`, `docs/`.
- Workflow reliability cannot be degraded for source/build/CI-relevant changes.
- Requirements Engineer may refine trigger patterns per workflow to avoid over-filtering.

## Recommendation
- Proceed.

## Acceptance Signal
- Commits changing only irrelevant paths do not trigger unrelated workflows.
- Relevant source/build/workflow changes still trigger expected workflows.

## Handoff Target
- Product Owner -> Requirements Engineer + Architect.

## Blocking Conditions
- Requires Architect gate completion before Requirements Engineer can transition item to `ready`.

## Issue Comment Log
| Time | Role | Type | Note | Status Impact |
| --- | --- | --- | --- | --- |
| 2026-03-05 16:10 | Product Owner | status | Captured stakeholder high-priority CI trigger optimization request and created PB-0010. | Product Owner: in-progress |
| 2026-03-05 16:10 | Product Owner | decision | Marked as highest-priority P0 due cross-cutting impact on every push; added override decision record DEC-0001. | None |
| 2026-03-05 16:10 | Product Owner | status | Completed intake framing and transitioned PB-0010 from `intake` to `shaped`. | Product Owner: done; item status: shaped |
| 2026-03-05 16:10 | Product Owner | handoff | Handoff package ready for Requirements Engineer to refine exact workflow-relevance file patterns and acceptance criteria. | None |
| 2026-03-05 16:10 | Requirements Engineer | status | Picked up PB-0010 refinement work and transitioned role gate from `pending` to `in-progress` to define workflow relevance boundaries and acceptance criteria. | Requirements Engineer: in-progress |
| 2026-03-05 16:11 | Requirements Engineer | decision | Resolved intake questions with minimal-risk assumptions for this slice: root-level build/config files (`Cargo.toml`, `Cargo.lock`, `Makefile`) always trigger workflows, and edits under `.github/workflows/**` trigger all workflows in scope. Assumptions documented in RFC-0010. | None |
| 2026-03-05 16:11 | Requirements Engineer | status | Completed PB-0010 requirements package in `docs/03-engineering/rfcs/RFC-0010-pb-0010-ci-workflow-trigger-path-filtering.md` with explicit scope, FR/NFR set, acceptance criteria, verification intent mapping, and traceability links. | Requirements Engineer: done |
| 2026-03-05 16:11 | Requirements Engineer | blocker | Cannot transition PB-0010 to `ready` yet because Architect gate is still `pending`; item remains `shaped` pending Architect completion per backlog blocking rules. | None |
