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
- done.

## Role Gate Matrix
| Role | State | Updated | Notes |
| --- | --- | --- | --- |
| Product Owner | done | 2026-03-05 | Intake framing and handoff completed. |
| Architect | done | 2026-03-05 | Orchestration policy defined in ADR-007. |
| Requirements Engineer | done | 2026-03-05 | Requirements package completed in RFC-0008 with FR/NFR, acceptance criteria, verification mapping, and traceability notes. |
| Quality Engineer | done | 2026-03-05 | Quality gate pass: snapshot/formal channel separation, PO-control and weekly policy enforcement, and semantic-release configuration evidence are sufficient. |
| Security Engineer | done | 2026-03-05 | Security gate pass; release-policy workflow and semantic-release configuration introduce no blocking security risk. |
| Implementing Developer | done | 2026-03-05 | Implemented snapshot-on-main workflow plus PO-controlled semantic-release formal channel with weekly-default policy enforcement. |
| Reviewing Developer | done | 2026-03-05 | Review completed with approved disposition; no findings. |

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
| 2026-03-05 15:53 | Quality Engineer | status | Started QE gate evaluation for PB-0008 from pending state; validated RFC-0008 acceptance intent against release-policy artifacts and independent local verification evidence. | Quality Engineer: in-progress |
| 2026-03-05 15:53 | Quality Engineer | decision | Quality gate decision: `pass`. Independent evidence passed via `make check`; configuration inspection confirms formal release path is workflow-dispatch only with PO approval input and weekly-default Sunday/Monday UTC guard (with explicit midweek-override mode), snapshot publication runs on every `main` push with traceable snapshot identifiers and checksums, and semantic-release semver configuration is present in `.releaserc.json`. AI evaluation report not required because this slice changes release orchestration infrastructure, not AI behavior. | Quality Engineer: done |
| 2026-03-05 15:53 | Quality Engineer | handoff | QE handoff to Reviewing Developer: no blocking quality evidence gaps found for PB-0008; item is quality-ready for downstream security/review sequencing. | None |
| 2026-03-05 18:32 | Security Engineer | status | Started Security Engineer gate evaluation for PB-0008 from pending state; reviewed RFC-0008 scope, `.github/workflows/release-policy.yml`, `.releaserc.json`, and independent local verification evidence (`make check`). | Security Engineer: in-progress |
| 2026-03-05 18:32 | Security Engineer | decision | Security findings summary: `none`. Security gate decision: `pass`. Evidence: formal release path is manually gated (`workflow_dispatch`) with explicit PO approval input and weekly-policy enforcement, snapshot/formal channels are separated, and no new runtime dependencies or secret-handling expansion were introduced beyond standard `GITHUB_TOKEN` usage in release automation. Residual low risk: third-party GitHub Action supply-chain exposure remains via version-tag references (`actions/*`, `dtolnay/rust-toolchain`, `cycjimmy/semantic-release-action`), and `GITHUB_TOKEN` write permissions in formal-release job should remain tightly scoped/reviewed. | Security Engineer: done |
| 2026-03-05 18:40 | Security Engineer | status | In-order `go` check against `Next Eligible Role(s)` selected PB-0008 first, but Security gate is already `done` and no new blocker/deliverable is present; moved to next eligible item (PB-0009) per processing-order rule. | None |
| 2026-03-05 18:42 | Security Engineer | status | In-order `go` check selected PB-0008 again from index, but Security gate remains `done` with no new blocker owned by Security; proceeded to next eligible item per processing-order rule. | None |
| 2026-03-05 18:48 | Reviewing Developer | status | Started Reviewing Developer work unit for PB-0008; transitioned item status to `review` and validated implementation, QE/Security handoff evidence, and RFC-0008 traceability. | item status: review; Reviewing Developer: in-progress |
| 2026-03-05 18:48 | Reviewing Developer | decision | Review complete with disposition `approved` and no findings (P0-P3 none). Independent verification rerun passed (`make check`), and review artifact recorded at `docs/04-quality/review-reports/PB-0008-review-report.md`. | Reviewing Developer: done |
| 2026-03-05 18:49 | Reviewing Developer | status | Stakeholder confirmation received via `go`; transitioned PB-0008 from `review` to `done`. Product Owner archive move/index cleanup follow-up is now pending per backlog ownership policy. | item status: done |
