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
- in-progress.

## Role Gate Matrix
| Role | State | Updated | Notes |
| --- | --- | --- | --- |
| Product Owner | done | 2026-03-05 | Intake framing, priority override, and RE handoff completed. |
| Architect | done | 2026-03-05 | Architecture constraints and trigger-scoping policy finalized in ADR-009 and implementation plan artifact. |
| Requirements Engineer | done | 2026-03-05 | Requirements package completed in RFC-0010 with FR/NFR, acceptance criteria, verification mapping, and traceability notes. |
| Quality Engineer | done | 2026-03-05 | Quality gate pass: path-scoped workflow triggers preserve required coverage while suppressing irrelevant-directory-only runs for in-scope workflows. |
| Security Engineer | pending | 2026-03-05 | Not started. |
| Implementing Developer | done | 2026-03-05 | Implemented per-workflow path-scoped triggers with fail-safe inclusions and validated local quality gates. |
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
| 2026-03-05 16:14 | Architect | status | Picked up PB-0010 Architect work unit and transitioned role gate from `pending` to `in-progress` for architecture constraint finalization. | Architect: in-progress |
| 2026-03-05 16:14 | Architect | decision | Recorded architecture-impacting trigger policy in `docs/03-engineering/decision-records/ADR-009-ci-workflow-trigger-path-scoping.md` to define per-workflow path scoping, fail-safe inclusions, and drift revisit triggers. | None |
| 2026-03-05 16:14 | Architect | handoff | Completed Architect technical outputs: updated `RFC-0010` with architecture constraints/interface assumptions and published implementation plan `docs/03-engineering/implementation-plans/PLAN-0010-pb-0010-ci-workflow-trigger-path-filtering.md` for implementation constraints, risk notes, and verification guidance. | None |
| 2026-03-05 16:14 | Architect | status | Architect gate complete for PB-0010 with no unresolved architecture ambiguity; Requirements Engineer can now execute `shaped` -> `ready` transition per ownership rules. | Architect: done |
| 2026-03-05 16:15 | Requirements Engineer | status | Confirmed Architect + Requirements Engineer gates are both `done`; resolved prior RE blocker and transitioned PB-0010 from `shaped` to `ready`. | item status: ready |
| 2026-03-05 16:18 | Implementing Developer | status | Transitioned PB-0010 from `ready` to `in-progress` and started implementation work for workflow trigger-path scoping. | item status: in-progress; Implementing Developer: in-progress |
| 2026-03-05 16:18 | Implementing Developer | handoff | Implemented path-scoped triggers in `.github/workflows/qa-gates.yml` and `.github/workflows/release-policy.yml` so irrelevant-only edits under `backlog/**`, `docs/**`, and `eval/**` no longer trigger these workflows, while preserving fail-safe inclusions for `src/**`, `Cargo.toml`, `Cargo.lock`, `Makefile`, and `.github/workflows/**` (plus `.releaserc.json` for release-policy). Validation evidence: `make check` passed. No runtime/CLI behavior changes and no dependency additions. | Implementing Developer: done |
| 2026-03-05 16:19 | Quality Engineer | status | Started QE gate evaluation for PB-0010 from pending state; validated RFC-0010 acceptance intent against workflow trigger configuration and independent local parity evidence. | Quality Engineer: in-progress |
| 2026-03-05 16:19 | Quality Engineer | decision | Quality gate decision: `pass`. Independent verification passed via `make check`, and workflow inspection confirms per-workflow path filtering suppresses irrelevant-only changes (`backlog/**`, `docs/**`, `eval/**`) while preserving required triggers for `src/**`, root build/config files (`Cargo.toml`, `Cargo.lock`, `Makefile`), and `.github/workflows/**` (plus `.releaserc.json` for release-policy). AI evaluation report not required because this slice changes CI trigger configuration, not AI behavior. | Quality Engineer: done |
| 2026-03-05 16:19 | Quality Engineer | handoff | QE handoff to Reviewing Developer: no blocking quality evidence gaps found for PB-0010; item is quality-ready for downstream security/review sequencing. | None |
