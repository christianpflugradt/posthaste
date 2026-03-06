# PB-0012: Security hardening by pinning GitHub Actions to commit SHAs

## Source
- Product Owner follow-up (2026-03-05): reduce CI/release supply-chain risk by pinning action references to immutable SHAs.
- Intake brief: `docs/01-product/intake/PB-0012-actions-sha-pinning-security-hardening.md`.

## Parent Link
- None

## Problem Statement
Current workflow action references use moving tags, leaving CI/release behavior exposed to upstream action drift.

## Desired Outcome
All in-scope workflow actions are pinned to immutable SHAs with a clear update policy.

## Vision Alignment
- High.

## Priority
- P1.

## Story Points
- 2

## Status
- review.

## Role Gate Matrix
| Role | State | Updated | Notes |
| --- | --- | --- | --- |
| Product Owner | done | 2026-03-05 | Intake framing and RE handoff completed. |
| Architect | done | 2026-03-05 | SHA-pinning architecture policy finalized (ADR-011) with RFC + implementation-plan handoff artifacts. |
| Requirements Engineer | done | 2026-03-05 | Requirements package completed in RFC-0012 with FR/NFR, assumptions, AC mapping, and traceability notes. |
| Quality Engineer | done | 2026-03-05 | Quality gate pass: in-scope workflow actions are SHA-pinned and behavior-preservation evidence is sufficient. |
| Security Engineer | done | 2026-03-05 | Security gate pass; SHA-pinning hardening introduces no blocking security findings. |
| Implementing Developer | done | 2026-03-05 | Pinned in-scope workflow actions to immutable SHAs and validated behavior parity via local quality gates. |
| Reviewing Developer | done | 2026-03-06 | Completed independent review; approved with no findings and documented evidence in `docs/04-quality/review-reports/PB-0012-review-report.md`. |

## Constraints
- Preserve current workflow behavior.
- No paid tooling dependency for pin management.
- Keep updates maintainable.

## Recommendation
- Proceed.

## Acceptance Signal
- Actions are SHA-pinned and workflows still pass.

## Handoff Target
- Product Owner -> Requirements Engineer + Architect.

## Blocking Conditions
- Requires Architect gate completion before Requirements Engineer can transition item to `ready`.

## Issue Comment Log
| Time | Role | Type | Note | Status Impact |
| --- | --- | --- | --- | --- |
| 2026-03-05 19:04 | Product Owner | status | Created PB-0012 from hardening backlog planning after baseline delivery. | Product Owner: in-progress |
| 2026-03-05 19:04 | Product Owner | status | Completed intake framing and moved PB-0012 from `intake` to `shaped`. | Product Owner: done; item status: shaped |
| 2026-03-05 19:04 | Product Owner | handoff | Handoff package ready for RE refinement on action-pin scope and update policy. | None |
| 2026-03-05 19:15 | Requirements Engineer | status | Picked up PB-0012 refinement and transitioned role gate from `pending` to `in-progress` for pinning scope/update-policy requirement definition. | Requirements Engineer: in-progress |
| 2026-03-05 19:15 | Requirements Engineer | decision | Resolved intake questions with minimal assumptions: monthly pin refresh cadence by default, and pin-refresh automation handled as separate follow-up backlog item. | None |
| 2026-03-05 19:15 | Requirements Engineer | status | Completed PB-0012 requirements package in `docs/03-engineering/rfcs/RFC-0012-pb-0012-actions-sha-pinning-security-hardening.md` with explicit scope, FR/NFR, AC mapping, and traceability. | Requirements Engineer: done |
| 2026-03-05 19:15 | Requirements Engineer | blocker | Cannot transition PB-0012 to `ready` yet because Architect gate is still `pending`; item remains `shaped` pending Architect completion. | None |
| 2026-03-05 21:02 | Architect | status | Picked up PB-0012 Architect work unit and transitioned role gate from `pending` to `in-progress` for action pinning architecture finalization. | Architect: in-progress |
| 2026-03-05 21:02 | Architect | decision | Recorded SHA-pinning architecture policy in `docs/03-engineering/decision-records/ADR-011-github-actions-sha-pinning-policy.md` including immutable reference requirements, refresh cadence, and revisit triggers. | None |
| 2026-03-05 21:02 | Architect | handoff | Published architect artifacts for implementation handoff: `docs/03-engineering/rfcs/RFC-0012-pb-0012-actions-sha-pinning-security-hardening.md` (constraints/interface assumptions) and `docs/03-engineering/implementation-plans/PLAN-0012-pb-0012-actions-sha-pinning-security-hardening.md` (task/risk/verification breakdown). | None |
| 2026-03-05 21:02 | Architect | status | Architect gate complete for PB-0012 with no unresolved architecture ambiguity; Requirements Engineer can transition item to `ready` per ownership rules. | Architect: done |
| 2026-03-05 21:03 | Requirements Engineer | status | Confirmed Architect + Requirements Engineer gates are both `done`; resolved prior RE blocker and transitioned PB-0012 from `shaped` to `ready`. | item status: ready |
| 2026-03-05 21:08 | Implementing Developer | status | Transitioned PB-0012 from `ready` to `in-progress` and started workflow action SHA-pinning implementation. | item status: in-progress; Implementing Developer: in-progress |
| 2026-03-05 21:08 | Implementing Developer | handoff | Replaced moving-tag action references with immutable commit SHAs across in-scope workflows (`qa-gates.yml`, `release-artifacts.yml`, `release-policy.yml`, `governance-checks.yml`) for `actions/checkout`, `actions/upload-artifact`, `actions/download-artifact`, `actions/setup-node`, `softprops/action-gh-release`, `cycjimmy/semantic-release-action`, and `dtolnay/rust-toolchain`. Behavior-preservation evidence: `make check` passed with no runtime or dependency changes. | Implementing Developer: done |
| 2026-03-05 21:11 | Quality Engineer | status | Started QE gate evaluation for PB-0012 from pending state; validated RFC-0012 acceptance intent against workflow pinning changes and independent local verification evidence. | Quality Engineer: in-progress |
| 2026-03-05 21:11 | Quality Engineer | decision | Quality gate decision: `pass`. Independent verification passed via `make check`, and in-scope workflow inspection confirms action references use immutable commit SHAs (no moving tags) across `qa-gates.yml`, `release-artifacts.yml`, `release-policy.yml`, and `governance-checks.yml`. No behavior-regression signal observed in local parity checks. AI evaluation report not required because this slice changes CI/release security hardening configuration only. | Quality Engineer: done |
| 2026-03-05 21:11 | Quality Engineer | handoff | QE handoff to Reviewing Developer: no blocking quality evidence gaps found for PB-0012; item is quality-ready for downstream security/review sequencing. | None |
| 2026-03-05 21:12 | Security Engineer | status | Started Security Engineer gate evaluation for PB-0012 from pending state; reviewed RFC-0012 scope, in-scope workflow action references, and independent local verification evidence (`make check`). | Security Engineer: in-progress |
| 2026-03-05 21:12 | Security Engineer | decision | Security findings summary: `none`. Security gate decision: `pass`. Evidence: in-scope workflows now use immutable action commit SHAs across checkout/toolchain/artifact/release steps, removing moving-tag drift exposure while preserving functional behavior. Residual low risk: pinned SHAs still require periodic rotation for upstream security updates; monthly refresh policy is documented and should be enforced consistently. | Security Engineer: done |
| 2026-03-06 07:46 | Reviewing Developer | status | Transitioned PB-0012 from `in-progress` to `review` and started independent review against rubric evidence set. | item status: review; Reviewing Developer: in-progress |
| 2026-03-06 07:46 | Reviewing Developer | decision | Review completed with no P0/P1/P2/P3 findings. Verified in-scope workflows use immutable commit SHAs and reran `make check` successfully; see `docs/04-quality/review-reports/PB-0012-review-report.md`. | Reviewing Developer: done |
| 2026-03-06 07:46 | Reviewing Developer | handoff | Review disposition is approved. Awaiting stakeholder confirmation before final `done` transition per status ownership policy. | None |
