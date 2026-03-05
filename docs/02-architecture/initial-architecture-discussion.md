# Initial Architecture Discussion

## Session Context
- Date: 2026-03-05
- Role: Architect
- Stakeholder: @cpf
- Parent product item: PB-0001
- Purpose: capture architecture discovery decisions and inputs that will later be converted into ADRs and implementation backlog items.

## Current Constraints (Known)
- Offline-first baseline.
- Low compute/storage footprint on average modern computer.
- Initial platform target: macOS arm64, Linux x86_64, modern Windows.
- Open-source dependencies/tooling, no paid-only workflow dependencies.
- Fixed decisions: Rust and GitHub.

## Open Decision Areas
- Language/runtime selection for initial foundation.
- Build/release packaging strategy for common architectures.
- Testing and QA toolchain baseline.
- CI/CD workflow structure and artifact publication strategy.
- Release/snapshot automation approach compatible with PO ownership.

## Conversation Notes
- Decision (2026-03-05): Use Rust for the initial technical foundation.
  - Rationale: native binary/distribution, high performance, modern language design, and security benefits.
- Decision (2026-03-05): Initial distribution target includes:
  - macOS arm64
  - Linux x86_64
  - modern Windows
- Decision rule (2026-03-05): If discovery/backlog work reveals major architectural implications (for example library/platform constraints), architect must return to stakeholder for re-decision.
- Governance note (2026-03-05): No architecture decision is immutable except Rust and GitHub.
- Decision process note (2026-03-05): Offline hashtag intelligence approach (static dataset/rules vs embedded local model) will be timeboxed for rapid evaluation; if not resolved quickly, create ADR with proposal and return to stakeholder.
- Decision (2026-03-05): MVP CLI output is plain hashtag text by default (human-first).
  - Expected usage: user provides text file, receives hashtags, manually selects/copies into LinkedIn post.
  - JSON output is not a primary MVP path because there is no handoff to downstream tools and no auto-publishing in product vision.
- Decision (2026-03-05): Offline popularity/relevance uses hybrid ranking.
  - small curated popularity priors + text-derived topic relevance.
  - pure curated-only and pure frequency-only strategies are both rejected for MVP.
  - formalized in ADR-004.
- Decision (2026-03-05): MVP build/release should not use cross-compilation helper tooling.
  - Use Cargo + GitHub Actions with native runners per supported target.
  - Assumption: runners are available for supported architectures/platforms.
- Decision (2026-03-05): Test baseline for initial foundation is unit tests only.
  - Additional integration/smoke tests are added later when stakeholder feedback or bug reports indicate need.
- Decision (2026-03-05): Enforce Rust formatter and clippy in CI from day one.
  - `cargo fmt --check`
  - `cargo clippy -- -D warnings`
  - Rationale: low setup effort now, avoid warning/format debt later.
- Decision (2026-03-05): Release artifacts should include binaries plus checksums from day one.
  - Cryptographic signing is deferred until key-management process is defined.
- Decision (2026-03-05): Use existing release tooling and avoid reinventing release workflows.
  - Preferred solution: `semantic-release` (subject to Security/Quality checks).
- Decision (2026-03-05): Release creation policy is PO-driven; not every push/feature change should trigger a formal release.
  - Snapshot artifacts should remain continuously available to prove operability.
  - Scheduled releases are preferred over purely ad-hoc release timing.
- Decision (2026-03-05): Initial formal release cadence is weekly.
  - Preferred release window: Sunday night to Monday.
  - Product Owner may hold/skip a scheduled release when quality or risk gates are not satisfactory.
- Decision (2026-03-05): CLI failure behavior is fail-fast.
  - For invalid file path, unreadable file, or empty input: return clear error and non-zero exit code.
- Decision (2026-03-05): MVP input source is file path only.
  - Rationale: sufficient for product vision at start.
  - stdin support is a later enhancement candidate for Product Owner prioritization.
- Decision (2026-03-05): MVP uses structured logging from day one.
  - Required levels: `info`, `warn`, `err`, `fatal`.
  - Implementing Developer must have explicit logging usage guidance for when each level applies.
- Decision principle (2026-03-05): Prefer changes that are low effort and high value from the start.
  - Applied now: use production-like binary naming (`posthaste`) from the beginning.
  - Keep initial crate structure minimal unless modularization yields clear near-term value.
- Decision (2026-03-05): Dependency strategy is stdlib-first by default.
  - Add external crates only when value is clearly justified.
  - This is the standing default approach for MVP architecture choices.
- Decision (2026-03-05): Versioning split between snapshots and formal releases is approved.
  - Snapshots use explicit snapshot identifiers with commit traceability (for example `0.1.0-snapshot.<sha>`).
  - Formal weekly releases use clean semver tags (for example `0.1.0`).
- Process correction (2026-03-05): Architecture questioning is limited to decisions that block MVP implementation start.
  - Non-blocking design choices are deferred to later backlog refinement.
  - Architect should propose a strong default when risk is low, instead of asking broad option questions.
- Note (2026-03-05): Commit conventions discussion is intentionally deferred to a dedicated follow-up session.

### Decision Focus: Offline Hashtag Intelligence (MVP)
- Option A: Rules + static curated hashtag datasets (bundled with binary).
- Option B: Embedded local ML/NLP model (bundled with binary).

### Decision Outcome (2026-03-05)
- MVP selects Option A.
- Architecture must preserve a common interface and loose coupling so Option B can be added later.
- Future strategy configurability (A/B) is intended once Option B exists.
- Formalized in ADR-003.

## Provisional Decisions
- Language/runtime candidate: Rust CLI baseline (subject to final ADR confirmation).
- Initial artifact/platform matrix candidate:
  - macOS arm64
  - Linux x86_64
  - Windows x86_64 (modern)
- CLI I/O candidate:
  - input: text file path (and optionally stdin later),
  - output: plain hashtag list by default,
  - optional machine output (for example `--json`) can be deferred.
- Build/release candidate:
  - no cross-compilation helper tooling for MVP,
  - native target builds on platform-appropriate GitHub runners.
- Test strategy candidate:
  - unit tests only for initial foundation,
  - expand test pyramid based on observed defects/feedback.
- QA tooling candidate:
  - formatter + strict clippy are mandatory from the start.
- Release artifact candidate:
  - per-target binaries + checksums,
  - signing deferred pending key-management policy.
- Release automation candidate:
  - semantic-release based flow,
  - always-on snapshot artifacts from CI,
  - formal releases triggered by PO timing policy (prefer scheduled cadence).

## Candidate ADR Topics (Draft)
- ADR-001: Rust as foundation language. (Accepted)
- ADR-002: GitHub as platform of record. (Accepted)
- ADR-003: Offline hashtag intelligence strategy (Option A now, Option B path). (Accepted)
- ADR-004: Offline popularity/relevance ranking strategy. (Accepted)
- ADR-005: Build system and artifact matrix. (Accepted)
- ADR-006: CI workflow gates and ordering. (Accepted)
- ADR-007: Release/snapshot strategy and semver policy. (Accepted)
- ADR-008: Dependency and tooling policy enforcement. (Accepted)

## Follow-up Items (To Create Later)
- Derived items created: PB-0003..PB-0009.
