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

## Functional Requirements
- FR-001: The architecture baseline must define a Rust/Cargo-only implementation path for MVP runtime and build operations.
- FR-002: The architecture baseline must define an offline hashtag strategy for MVP using deterministic rules plus curated static data.
- FR-003: The architecture baseline must define a ranking approach that combines curated popularity priors and text relevance signals.
- FR-004: The architecture baseline must define the MVP CLI contract as file-path input and plain-text ordered hashtag output.
- FR-005: The architecture baseline must define CI and release constraints required for derived slices PB-0003 through PB-0009.

## Non-Functional Requirements
- NFR-001: Architecture decisions must be traceable to durable ADR artifacts and linked to PB-0002.
- NFR-002: Build and release flow must be deterministic and GitHub-native for supported targets (no cross-compilation helper layer for MVP).
- NFR-003: Quality gates must be explicit and blocking when they fail (`fmt`, `clippy -D warnings`, `test`).
- NFR-004: Dependency policy must remain stdlib-first and open-source-first, with explicit justification required before adding external crates.
- NFR-005: Architecture must preserve an extensibility seam for future Option B intelligence without requiring CLI contract rewrite.

## Non-Goals
- Cloud-hosted inference or paid tooling.
- JSON-first automation interface in MVP.
- Artifact signing in MVP (deferred until key-management policy exists).
- Stdin input support in MVP.

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

## Assumptions
- Current MVP target audience and evaluation remain English-first and stakeholder-usefulness driven.
- Native runner availability on GitHub for selected matrix targets remains stable.
- Weekly formal release window is PO-controlled and may be skipped/held when quality evidence is insufficient.

## Acceptance Criteria
- AC-001: Architecture baseline is fully traceable to ADR-001 through ADR-008.
- AC-002: Derived slices PB-0003..PB-0009 are implementation-ready from an architecture perspective.
- AC-003: No unresolved architecture ambiguity remains that blocks Requirements Engineer from `ready` transitions on derived slices.

## Verification Intent Mapping
| Acceptance Criterion | Verification Intent |
| --- | --- |
| AC-001 | Document inspection confirms links and consistency across RFC-0001 and ADR-001..ADR-008. |
| AC-002 | Backlog inspection confirms PB-0003..PB-0009 exist with clear scope, constraints, and architecture lineage to PB-0002/ADRs. |
| AC-003 | Issue-log and role-gate inspection confirms Architect handoff states no unresolved architecture blockers. |

## Requirement Traceability Notes
| Requirement | Traceability |
| --- | --- |
| FR-001, NFR-004 | ADR-001, ADR-008 |
| FR-002, FR-003, NFR-005 | ADR-003, ADR-004 |
| FR-004 | ADR-003, Architect decision log entries in PB-0002 (plain text output, file-path input, fail-fast errors) |
| FR-005, NFR-002, NFR-003 | ADR-002, ADR-005, ADR-006, ADR-007 |
