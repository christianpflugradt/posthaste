# PB-0001: MVP: CLI text to ordered LinkedIn hashtags (offline-first)

## Source
- Stakeholder request (2026-03-05): build a local CLI tool that suggests relevant and commonly used LinkedIn hashtags from post text.
- Intake brief: `docs/01-product/intake/PB-0001-stakeholder-intake.md`.

## Problem Statement
Solo creators need fast, relevant hashtag suggestions without manual research and without relying on paid infrastructure.

## Desired Outcome
Given post text input, output ordered hashtags that balance relevance with common LinkedIn usage.

## Vision Alignment
- High.

## Priority
- P0.

## Status
- in-progress.

## Role Gate Matrix
| Role | State | Updated | Notes |
| --- | --- | --- | --- |
| Product Owner | done | 2026-03-05 | Intake framing, recommendation, and handoff package completed. |
| Architect | done | 2026-03-05 | Architecture baseline finalized via ADR-001..ADR-008 and PB-0002 handoff artifacts. |
| Requirements Engineer | done | 2026-03-05 | Requirements package completed in RFC-0002 with FR/NFR, acceptance criteria, verification mapping, and traceability notes. |
| Quality Engineer | blocked | 2026-03-05 | Quality checks pass (`fmt`, `clippy`, `test`) but AI-affecting gate is blocked pending fixture-baseline evaluation evidence per quality policy. |
| Security Engineer | done | 2026-03-05 | Security gate pass for current implementation increment; no blocking findings. |
| Implementing Developer | done | 2026-03-05 | Implemented offline Rust CLI, deterministic ranking, fail-fast input errors, and unit-test evidence package. |
| Reviewing Developer | pending | 2026-03-05 | Not started. |

## Constraints
- Offline-first.
- Low compute/storage footprint on average modern computer.
- English-first MVP; multilingual considered later.

## Recommendation
- Proceed.

## Acceptance Signal
- Stakeholder judges output usefulness and fit.

## Handoff Target
- Product Owner -> Architect + Requirements Engineer.

## Blocking Conditions
- Issue cannot be marked `ready` until Architect and Requirements Engineer are `done`.

## Issue Comment Log
| Time | Role | Type | Note | Status Impact |
| --- | --- | --- | --- | --- |
| 2026-03-05 07:00 | Product Owner | status | Initial MVP request captured and prioritized. | Product Owner: in-progress |
| 2026-03-05 11:58 | Product Owner | decision | Proactive review (regular+deep) completed: backlog order validated, item sizing compliant (all open items 1-3 SP where estimated), and no deferred-item roadmap drift detected. | None |
| 2026-03-05 12:03 | Requirements Engineer | decision | Proactive review (regular+deep) completed: ran ambiguity/acceptance-criteria quality and traceability consistency pass across PB-0001..PB-0009; no cross-item requirement contradictions found, and non-ready items correctly show pending RE refinement before `ready`. | None |
| 2026-03-05 12:05 | Quality Engineer | decision | Proactive review (regular+deep) completed: audited current quality surface and gate effectiveness; repository has no source/test artifacts yet, no flaky signals detected, and quality gates/templates remain coherent for upcoming implementation evidence handoff. | None |
| 2026-03-05 12:08 | Security Engineer | decision | Proactive review (regular+deep) completed: reviewed dependency/security posture and control-coverage/residual-risk trend across open work; repository currently has no source code, runtime dependencies, or CI pipelines, security baseline policies/ADRs remain internally consistent, and no immediate security hardening follow-up item is required. | None |
| 2026-03-05 12:12 | Implementing Developer | decision | Proactive review (regular+deep) completed: ran implementation consistency/maintainability and technical-debt/duplication hotspot scan; repository currently has no source/build artifacts, so no implementation drift or debt hotspots were found. Implementation remains blocked until an item reaches `ready` after Architect + Requirements Engineer completion. | None |
| 2026-03-05 12:36 | Implementing Developer | blocker | `go` processing check: no implementation work unit is eligible from index order for this role at present (`PB-0001` is `shaped` and requires Architect + Requirements Engineer completion before `ready`). | None |
| 2026-03-05 12:12 | Reviewing Developer | decision | Proactive review (regular+deep) completed: performed finding-pattern/severity-consistency pass and rubric-calibration/follow-up-aging review across open backlog and review templates; no implementation review artifacts exist yet, no severity-calibration drift detected, and no aging follow-ups require escalation. | None |
| 2026-03-05 12:14 | Product Owner | status | Completed intake framing artifact and recommendation; moved PB-0001 from `intake` to `shaped`. | Product Owner: done; item status: shaped |
| 2026-03-05 12:14 | Product Owner | handoff | Provided intake brief package and proceed recommendation for Architect + Requirements Engineer specification workflow. | None |
| 2026-03-05 12:21 | Quality Engineer | status | No QE gate action is currently eligible on PB-0001 because the item remains in shaping/specification flow (Architect and Requirements Engineer gates not complete); proceeding to next eligible backlog item per processing-order rule. | None |
| 2026-03-05 12:39 | Architect | status | Started Architect PB-0001 work unit and validated architecture scope alignment to parent technical discovery item PB-0002. | Architect: in-progress |
| 2026-03-05 12:39 | Architect | handoff | Architecture package for PB-0001 is complete and implementation-ready via ADR-001..ADR-008 plus `docs/03-engineering/rfcs/RFC-0001-mvp-cli-foundation.md` and `docs/03-engineering/implementation-plans/PLAN-0001-pb-0002-architecture-slices.md`; constraints include offline-first, Rust/Cargo baseline, stdlib-first dependencies, file-path input MVP, fail-fast errors, and GitHub-native CI/release. | None |
| 2026-03-05 12:39 | Architect | status | Architect gate complete for PB-0001 with no unresolved architecture ambiguity; Requirements Engineer can proceed with testable acceptance criteria and `ready` transition gating when complete. | Architect: done |
| 2026-03-05 12:51 | Requirements Engineer | status | Completed PB-0001 requirements package in `docs/03-engineering/rfcs/RFC-0002-pb-0001-mvp-hashtag-requirements.md` with explicit scope boundaries, FR/NFR set, acceptance criteria, verification intent mapping, and traceability links to ADR-001..ADR-008. | Requirements Engineer: done |
| 2026-03-05 12:51 | Requirements Engineer | status | Confirmed Architect + Requirements Engineer gates are both `done`; transitioned PB-0001 from `shaped` to `ready`. | item status: ready |
| 2026-03-05 12:58 | Implementing Developer | status | Transitioned PB-0001 from `ready` to `in-progress` and started implementation work per RFC-0002 scope. | item status: in-progress; Implementing Developer: in-progress |
| 2026-03-05 12:58 | Implementing Developer | handoff | Implemented MVP runtime artifacts: `Cargo.toml`, `src/main.rs`, and `src/lib.rs` with offline deterministic hashtag ranking, file-path input, plain-text hashtag output, and fail-fast non-zero error handling for invalid/unreadable/empty input. Added unit tests for determinism, count bounds, broad-vs-specific balance behavior, and CLI error boundaries. Evidence package for QE/Security: `cargo fmt --check`, `cargo clippy -- -D warnings`, and `cargo test` all passed. Dependency/security note: no external crates added (stdlib-only). | Implementing Developer: done |
| 2026-03-05 13:11 | Reviewing Developer | blocker | In-order review check on PB-0001: review cannot start yet because required pre-review gates are incomplete (`Quality Engineer: pending`, `Security Engineer: pending`). Awaiting QE and Security handoff evidence before transitioning to `review`. | None |
| 2026-03-05 13:13 | Quality Engineer | status | Started QE gate evaluation for PB-0001 from pending state; validated implementation evidence against RFC-0002 acceptance intent and required quality gates. | Quality Engineer: in-progress |
| 2026-03-05 13:13 | Quality Engineer | decision | Quality gate decision: `blocked`. Verified checks passed locally (`cargo fmt --check`, `cargo clippy -- -D warnings`, `cargo test`), but this is an AI-affecting behavior change and required fixture-based baseline evaluation evidence is missing (no runnable fixture set/baseline outputs in `eval/`, no recorded metric deltas). Evaluation artifact recorded in `docs/04-quality/evaluation-reports/PB-0001-evaluation-report.md` with fail outcome pending evidence completion. | Quality Engineer: blocked |
| 2026-03-05 13:13 | Quality Engineer | blocker | Missing/insufficient evidence list: (1) fixture inputs in `eval/fixtures/` for PB-0001 scenarios, (2) baseline outputs/threshold reference in `eval/baselines/`, and (3) executed evaluation results for relevance/specificity/diversity/format-validity against baseline. Review handoff remains blocked until these are provided or stakeholder explicitly accepts risk. | None |
| 2026-03-05 13:14 | Security Engineer | status | Started Security Engineer gate evaluation for PB-0001 from pending state; reviewed RFC-0002 requirements, implementation artifacts (`Cargo.toml`, `src/main.rs`, `src/lib.rs`), dependency surface, and local verification evidence (`cargo fmt --check`, `cargo clippy -- -D warnings`, `cargo test`). | Security Engineer: in-progress |
| 2026-03-05 13:14 | Security Engineer | decision | Security findings summary: `none` (no high/critical issues). Security gate decision: `pass`. Evidence: runtime remains offline-first, dependency surface is stdlib-only (no external crates), CLI input handling fails closed with non-zero exits for invalid/unreadable/empty input, and no secrets/network integrations are introduced. Residual low risk: file input is read fully into memory (`read_to_string`), so very large local files can cause resource pressure; accepted as non-blocking for MVP CLI baseline and should be revisited if untrusted/large-input usage grows. | Security Engineer: done |
| 2026-03-05 13:42 | Architect | blocker | `go` processing check: no Architect contribution is currently eligible on PB-0001 because Architect gate is already `done` and the item is in implementation-quality flow with non-architect blockers (`Quality Engineer: blocked`). | None |
