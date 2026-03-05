# RFC: PB-0020 Hybrid Ranking v2 (NLP + Popularity)

## Feature Name
PB-0020 hybrid ranking v2 (NLP relevance + popularity)

## Problem
Current ranking does not yet combine richer NLP relevance and refreshed popularity signals into the planned v2 scoring behavior.

## Proposed Solution
Define requirements for deterministic hybrid scoring that blends NLP-derived relevance and popularity inputs with measurable fixture-based quality improvement.

## User Value
Users get better ordered hashtags that balance semantic fit and practical popularity.

## Scope
- In scope:
  - Hybrid v2 scoring contract using NLP signals and popularity cache inputs.
  - Deterministic offline scoring behavior.
  - Measurable evaluation-gate definition for rollout.
- Out of scope:
  - Model training pipeline automation.
  - User-history personalization.

## Functional Requirements
- FR-001: Ranking combines NLP relevance and popularity signals in one deterministic score.
- FR-002: v2 uses fixed default weighting in first increment (no user-configurable weighting).
- FR-003: Ranking output remains ordered and compatible with existing output contract.
- FR-004: Rollout gate requires minimum +10% lift on agreed local fixture composite metric versus baseline.
- FR-005: Evaluation evidence is required before promotion of v2 behavior.

## Non-Functional Requirements
- NFR-001: Core execution remains offline and deterministic for identical inputs/cache state.
- NFR-002: Scoring behavior remains auditable with clear weighting/normalization documentation.
- NFR-003: Requirements and AC trace to PB-0020 intake and parent MVP goals.

## Assumptions
- Assumption A1: Configurable weighting is deferred; first increment uses fixed weights.
- Assumption A2: Minimum rollout gate is +10% measured lift on local fixture composite metric.

## Acceptance Criteria
- AC-001: Requirements explicitly define hybrid score composition and fixed-weight initial policy.
- AC-002: Requirements define measurable rollout threshold and evidence expectations.
- AC-003: Verification mapping and traceability are complete for implementation handoff.

## Verification Intent Mapping
| Acceptance Criterion | Verification Intent |
| --- | --- |
| AC-001 | Design/tests confirm ranking uses both NLP and popularity signals with deterministic fixed-weight scoring. |
| AC-002 | Evaluation evidence confirms measured lift threshold is met before rollout. |
| AC-003 | Traceability review confirms PB-0020 mapping from intake -> RFC -> evaluation/validation evidence. |

## Requirement Traceability Notes
| Requirement | Traceability |
| --- | --- |
| FR-001, FR-003, NFR-001 | PB-0020 problem statement and desired outcome |
| FR-002, A1 | PB-0020 intake question on configurable weighting |
| FR-004, A2, FR-005 | PB-0020 intake question on minimum measured lift threshold |
| NFR-002 | PB-0020 risk on ranking interpretability |
| NFR-003, AC-003 | PB-0020 parent link and handoff requirements |
