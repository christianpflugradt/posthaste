# RFC: PB-0001 MVP Hashtag Suggestion Requirements

## Feature Name
PB-0001 MVP CLI text to ordered LinkedIn hashtags (offline-first)

## Problem
Solo creators spend excessive time manually researching hashtags, with inconsistent quality and no reliable local-first workflow.

## Proposed Solution
Define the MVP behavior contract for offline hashtag suggestion so implementation can proceed with deterministic, testable requirements aligned to accepted architecture decisions (ADR-001..ADR-008).

## User Value
Users can submit post text and quickly receive a ranked plain-text hashtag list that reduces manual research effort while remaining predictable and local.

## Scope
- In scope:
  - File-path input for post text.
  - Ordered hashtag output in plain text only.
  - Offline deterministic suggestion approach using curated data + relevance logic.
  - Clear fail-fast behavior for invalid input conditions.
- Out of scope:
  - Multilingual behavior.
  - Network-dependent trend lookups.
  - JSON-first output mode.
  - Stdin input path.
  - Artifact signing and release-policy mechanics (handled by separate backlog slices).

## Functional Requirements
- FR-001: CLI accepts one file-path input and reads post text from that file.
- FR-002: CLI returns an ordered list of hashtag tokens (each prefixed with `#`) in plain text output.
- FR-003: Default output count is bounded to `5..10` hashtags, with deterministic ordering for identical input and data.
- FR-004: Ranking must blend relevance signals from input text with curated popularity priors (not popularity-only and not relevance-only).
- FR-005: Generic high-usage hashtags must not dominate output; list should include a mix of broad and specific tags when relevant candidates exist.
- FR-006: CLI exits non-zero and prints a clear error message for unreadable path, invalid path, or empty input.

## Non-Functional Requirements
- NFR-001: Behavior must be fully offline at runtime for suggestion generation.
- NFR-002: Determinism is required for repeated runs with identical input and curated data snapshot.
- NFR-003: Implementation must remain Rust/Cargo and respect stdlib-first dependency policy.
- NFR-004: Requirements and acceptance criteria must remain traceable to PB-0001 and ADR-001..ADR-008.

## Technical Plan
- Use architecture baseline and interfaces from RFC-0001 and ADR-003/ADR-004.
- Implement hashtag selection/ranking in dedicated follow-up implementation slices derived from PB-0001.
- Verify baseline behavior through deterministic unit tests and CLI-level checks in later implementation units.

## Risks
- Curated data quality/coverage may underperform in niche domains.
- Generic-tag suppression quality can drift without explicit fixtures.
- Fixed default count range may require adjustment after stakeholder trials.

## Test Plan
- Add unit tests for deterministic ranking and count bounds.
- Add tests for error exits on unreadable/invalid/empty inputs.
- Add fixture-based checks covering generic vs specific tag balance.

## Evaluation Plan
- Stakeholder usefulness review on real draft posts remains the primary acceptance signal for MVP.
- AI evaluation framework execution is required when behavior-producing model/ranking logic is implemented.

## Assumptions
- A `5..10` default hashtag range is sufficient for MVP usability and can be tuned post-feedback.
- Generic-tag control is defined as output-balance behavior, with exact scoring thresholds to be implementation-calibrated.

## Acceptance Criteria
- AC-001: Requirements package defines explicit in-scope/out-of-scope boundaries consistent with product intake and ADR constraints.
- AC-002: Functional and non-functional requirements are specific enough to implement without material ambiguity.
- AC-003: Acceptance criteria are mapped to clear verification intent and traceable artifacts.

## Verification Intent Mapping
| Acceptance Criterion | Verification Intent |
| --- | --- |
| AC-001 | Document inspection confirms scope boundaries align with PB-0001 intake and ADR-003/ADR-004 CLI behavior decisions. |
| AC-002 | Requirement review confirms FR/NFR statements are testable and include deterministic/error-boundary expectations. |
| AC-003 | Traceability review confirms links from PB-0001 -> RFC-0002 -> ADR set and planned test evidence. |

## Requirement Traceability Notes
| Requirement | Traceability |
| --- | --- |
| FR-001, FR-002, FR-006 | ADR-003, PB-0002 architect decision log (file-path input, plain text output, fail-fast errors) |
| FR-003, FR-004, FR-005, NFR-001, NFR-002 | ADR-003, ADR-004 |
| NFR-003 | ADR-001, ADR-008 |
| NFR-004, AC-003 | PB-0001, RFC-0001, ADR-001..ADR-008 |
