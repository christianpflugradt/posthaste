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
- review.

## Role Gate Matrix
| Role | State | Updated | Notes |
| --- | --- | --- | --- |
| Product Owner | done | 2026-03-05 | Intake framing, recommendation, and handoff package completed. |
| Architect | done | 2026-03-05 | Architecture baseline finalized via ADR-001..ADR-008 and PB-0002 handoff artifacts. |
| Requirements Engineer | done | 2026-03-05 | Requirements package completed in RFC-0002 with FR/NFR, acceptance criteria, verification mapping, and traceability notes. |
| Quality Engineer | done | 2026-03-05 | Quality gate pass after independent verification of non-AI checks plus fixture-baseline evaluation metrics above thresholds. |
| Security Engineer | done | 2026-03-05 | Security gate pass for current implementation increment; no blocking findings. |
| Implementing Developer | done | 2026-03-05 | Implemented runtime plus fixture-based evaluation evidence and requirement-alignment fixes for count bounds/mix behavior. |
| Reviewing Developer | done | 2026-03-05 | Review completed with approved disposition; no findings. |

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
| 2026-03-05 14:08 | Implementing Developer | blocker | `go` processing check: no additional implementation work unit is currently eligible in index order (`PB-0007`, `PB-0008`, and `PB-0009` all require Requirements Engineer completion before `ready`). | None |
| 2026-03-05 13:11 | Reviewing Developer | blocker | In-order review check on PB-0001: review cannot start yet because required pre-review gates are incomplete (`Quality Engineer: pending`, `Security Engineer: pending`). Awaiting QE and Security handoff evidence before transitioning to `review`. | None |
| 2026-03-05 13:13 | Quality Engineer | status | Started QE gate evaluation for PB-0001 from pending state; validated implementation evidence against RFC-0002 acceptance intent and required quality gates. | Quality Engineer: in-progress |
| 2026-03-05 13:13 | Quality Engineer | decision | Quality gate decision: `blocked`. Verified checks passed locally (`cargo fmt --check`, `cargo clippy -- -D warnings`, `cargo test`), but this is an AI-affecting behavior change and required fixture-based baseline evaluation evidence is missing (no runnable fixture set/baseline outputs in `eval/`, no recorded metric deltas). Evaluation artifact recorded in `docs/04-quality/evaluation-reports/PB-0001-evaluation-report.md` with fail outcome pending evidence completion. | Quality Engineer: blocked |
| 2026-03-05 13:13 | Quality Engineer | blocker | Missing/insufficient evidence list: (1) fixture inputs in `eval/fixtures/` for PB-0001 scenarios, (2) baseline outputs/threshold reference in `eval/baselines/`, and (3) executed evaluation results for relevance/specificity/diversity/format-validity against baseline. Review handoff remains blocked until these are provided or stakeholder explicitly accepts risk. | None |
| 2026-03-05 13:14 | Security Engineer | status | Started Security Engineer gate evaluation for PB-0001 from pending state; reviewed RFC-0002 requirements, implementation artifacts (`Cargo.toml`, `src/main.rs`, `src/lib.rs`), dependency surface, and local verification evidence (`cargo fmt --check`, `cargo clippy -- -D warnings`, `cargo test`). | Security Engineer: in-progress |
| 2026-03-05 13:14 | Security Engineer | decision | Security findings summary: `none` (no high/critical issues). Security gate decision: `pass`. Evidence: runtime remains offline-first, dependency surface is stdlib-only (no external crates), CLI input handling fails closed with non-zero exits for invalid/unreadable/empty input, and no secrets/network integrations are introduced. Residual low risk: file input is read fully into memory (`read_to_string`), so very large local files can cause resource pressure; accepted as non-blocking for MVP CLI baseline and should be revisited if untrusted/large-input usage grows. | Security Engineer: done |
| 2026-03-05 13:42 | Architect | blocker | `go` processing check: no Architect contribution is currently eligible on PB-0001 because Architect gate is already `done` and the item is in implementation-quality flow with non-architect blockers (`Quality Engineer: blocked`). | None |
| 2026-03-05 13:48 | Reviewing Developer | blocker | In-order review re-check on PB-0001: review remains ineligible because pre-review quality gate is unresolved (`Quality Engineer: blocked` on missing fixture-baseline evaluation evidence). Security gate is complete (`done`), but review cannot transition to `review` until QE blocker is cleared or stakeholder explicitly accepts risk. | None |
| 2026-03-05 13:50 | Quality Engineer | blocker | In-order `go` check confirms no new PB-0001 evaluation evidence has been added since the prior QE blocker decision (fixture/baseline/metric gaps unchanged); QE gate remains `blocked`, so work proceeds to next eligible backlog item per processing-order rule. | None |
| 2026-03-05 14:33 | Reviewing Developer | blocker | In-order review check remains blocked for PB-0001: Quality Engineer gate is still `blocked` due to missing fixture/baseline evaluation evidence, so Reviewing Developer cannot start review or transition item status to `review`. Security gate remains `done`; no additional Reviewing Developer action is eligible until QE blocker is resolved or risk is explicitly accepted by stakeholder. | None |
| 2026-03-05 14:36 | Implementing Developer | blocker | `go` processing check: no new implementation work unit is eligible in index order because `PB-0007`, `PB-0008`, and `PB-0009` remain blocked on Requirements Engineer completion before `ready`. | None |
| 2026-03-05 14:46 | Implementing Developer | status | Resumed PB-0001 implementation work to address QE blocker on missing AI-evaluation evidence and requirement-alignment gaps identified during evaluation prep. | Implementing Developer: in-progress |
| 2026-03-05 14:46 | Implementing Developer | handoff | Delivered QE/Security evidence package for blocker resolution: added fixture corpus (`eval/fixtures/pb-0001/*.txt`), baseline expectations (`eval/baselines/pb-0001/*.expected`), explicit thresholds (`eval/baselines/pb-0001-thresholds.env`), runnable evaluation harness (`eval/run-pb-0001-eval.sh`), and run artifact (`eval/results/PB-0001-eval-latest.md`). Updated evaluation report to pass (`docs/04-quality/evaluation-reports/PB-0001-evaluation-report.md`). Also aligned runtime with PB-0001 FRs by ensuring bounded output behavior for sparse inputs and broad/specific mix support when broad relevant candidates exist (`src/lib.rs`), with additional regression test coverage. Validation evidence: `make check` and `./eval/run-pb-0001-eval.sh` both passed. | Implementing Developer: done |
| 2026-03-05 14:48 | Implementing Developer | blocker | `go` processing check: no new implementation work unit is currently eligible in index order because `PB-0007`, `PB-0008`, and `PB-0009` are still not `ready` (Requirements Engineer gates remain pending). | None |
| 2026-03-05 14:49 | Quality Engineer | status | Resumed PB-0001 QE gate from `blocked` state under Unblock Priority Rule after new evaluation artifacts were provided in implementation handoff. | Quality Engineer: in-progress |
| 2026-03-05 14:49 | Quality Engineer | decision | Quality gate decision: `pass`. Independent rerun evidence succeeded: `make check` (`cargo fmt --check`, `cargo clippy -- -D warnings`, `cargo test`) and `./eval/run-pb-0001-eval.sh` both pass. AI metrics meet thresholds: relevance `1.0000` (>=`0.95`), specificity `0.9062` (>=`0.60`), diversity `0.7500` (>=`0.50`), format validity `1.0000` (>=`1.00`). | Quality Engineer: done |
| 2026-03-05 14:49 | Quality Engineer | handoff | QE blocker cleared; PB-0001 is quality-ready for Reviewing Developer transition to `review` (Security and Implementing Developer gates are also `done`). | None |
| 2026-03-05 15:03 | Implementing Developer | blocker | `go` processing check after QE unblock: no new Implementing Developer work unit is eligible in index order because `PB-0007`, `PB-0008`, and `PB-0009` are not `ready` (Requirements Engineer gates are pending). No further implementer-owned blocker remains on PB-0001. | None |
| 2026-03-05 14:58 | Architect | blocker | `go` processing check: no Architect contribution is currently eligible on PB-0001 because Architect gate is already `done` and remaining work is downstream role sequencing (`Reviewing Developer` transition/disposition). | None |
| 2026-03-05 15:00 | Reviewing Developer | status | Started Reviewing Developer work unit for PB-0001; transitioned item status to `review` and began independent validation of runtime code, QE/Security handoff evidence, and PB-0001 requirement traceability. | item status: review; Reviewing Developer: in-progress |
| 2026-03-05 15:00 | Reviewing Developer | decision | Review complete with disposition `approved` and no findings (P0-P3 none). Independent evidence rerun passed (`make check`, `./eval/run-pb-0001-eval.sh`), and review artifact recorded at `docs/04-quality/review-reports/PB-0001-review-report.md`. | Reviewing Developer: done |
