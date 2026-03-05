# RFC: MVP CLI Foundation Architecture (PB-0002)

## Summary
Define the implementation-ready architecture baseline for `posthaste` MVP as an offline-first Rust CLI that returns ordered LinkedIn hashtag suggestions using deterministic rules + curated data.

## Problem Statement
Implementation cannot proceed safely without explicit architecture constraints, interface assumptions, and risk controls for offline behavior, CI quality gates, and release orchestration.

## User Impact
- Users get a local binary that works without network dependency for hashtag generation.
- Developers get deterministic build/test/release constraints that reduce setup ambiguity.

## Goals
- Keep MVP architecture minimal, offline-first, and stdlib-first.
- Establish traceable architecture decisions for language, CI, artifacts, and release flow.
- Define module boundaries that enable future evolution to richer local intelligence.

## Non-Goals
- Cloud-hosted inference or paid tooling.
- JSON-first automation interface in MVP.
- Artifact signing in MVP (deferred until key-management policy exists).

## Proposed Approach
- Runtime and platform:
  - Rust baseline with Cargo-managed build/test workflow (ADR-001).
  - GitHub as source-of-truth, CI, and release platform (ADR-002).
- Suggestion architecture:
  - Option A now: rules + static curated dataset for offline intelligence (ADR-003).
  - Ranking combines curated popularity priors with text relevance signals (ADR-004).
  - Keep strategy boundary loose so future Option B can be integrated without rewriting CLI boundary (ADR-003).
- Delivery architecture:
  - Native CI build matrix on GitHub-hosted runners: macOS arm64, Linux x86_64, Windows x86_64 (ADR-005).
  - Required QA gates in order: `cargo fmt --check`, `cargo clippy -- -D warnings`, `cargo test` (ADR-006).
  - Release flow supports continuous snapshots and PO-controlled formal weekly releases (ADR-007).
  - Dependency policy is stdlib-first; external crates require explicit value justification (ADR-008).

## Alternatives Considered
- Embedded local model for MVP intelligence: rejected due complexity/risk versus Option A speed.
- Cross-compilation helper tooling for matrix targets: rejected for MVP simplicity and transparency.
- Curated-only or relevance-only ranking: rejected in favor of hybrid ranking signal quality.

## Risks & Mitigations
- Risk: curated data staleness may hurt hashtag quality.
  - Mitigation: define data refresh follow-up backlog item once MVP baseline lands.
- Risk: release automation complexity may delay first usable release.
  - Mitigation: keep initial release pipeline focused on binary + checksums only.
- Risk: adding crates too early can increase security/maintenance overhead.
  - Mitigation: enforce ADR-008 pre-check and default to stdlib.

## Rollout Plan
1. Execute derived slices PB-0003 through PB-0009 in index order.
2. Keep snapshot artifacts available continuously during early iterations.
3. Run formal release cadence weekly with Product Owner hold/skip authority.

## Testing Plan
- Unit-test-first baseline for MVP.
- CI must fail-fast when any required QA gate fails.
- Multi-platform build verification via native runner matrix.

## Evaluation Plan
- No AI-model evaluation run required for this architecture unit (no model behavior introduced here).
- Baseline confidence comes from deterministic build/test/release pipeline evidence on derived implementation slices.

## Open Questions
- What curated hashtag seed governance process should be used after MVP launch?
- At what threshold should stdin input support be added relative to file-path-only MVP input?

## Acceptance Criteria
- Architecture baseline is fully traceable to ADR-001 through ADR-008.
- Derived slices PB-0003..PB-0009 are implementation-ready from an architecture perspective.
- No unresolved architecture ambiguity blocks Requirements Engineer from setting `ready` on derived slices.
