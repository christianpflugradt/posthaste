# RFC: PB-0018 Local NLP Intent/Topic Extraction Foundation

## Feature Name
PB-0018 local NLP intent/topic extraction foundation

## Problem
Keyword-only matching lacks sufficient semantic signal for consistently relevant hashtag ranking.

## Proposed Solution
Define requirements for an offline local NLP extraction foundation that emits deterministic intent/topic signals usable by downstream ranking slices.

## User Value
Users receive hashtag suggestions aligned to clearer post intent/topic interpretation.

## Scope
- In scope:
  - Offline intent/topic extraction foundation and signal contract definition.
  - Deterministic local behavior expectations.
  - Integration boundary definition for downstream ranking inputs.
- Out of scope:
  - Cloud NLP dependency.
  - Multilingual NLP rollout in this phase.
  - Full end-to-end ranking rework in a single slice.

## Functional Requirements
- FR-001: Extraction foundation produces structured intent/topic signals from post text locally (offline runtime).
- FR-002: Signal output contract is stable enough for downstream ranking integration slices.
- FR-003: Initial extraction approach is heuristic-first with optional future model-assisted extension.
- FR-004: Initial increment does not require domain-specific intent classes; generic classes are acceptable baseline.
- FR-005: Parent scope is kept at 5 SP and prepared for follow-up slices if deeper expansion is required.

## Non-Functional Requirements
- NFR-001: Behavior remains deterministic across runs for same input/configuration.
- NFR-002: Core tooling/dependencies remain open-source and local-execution compatible.
- NFR-003: Requirements and AC trace to PB-0018 intake and offline-first architecture constraints.

## Assumptions
- Assumption A1: Initial increment is heuristic-first (not model-assisted inference).
- Assumption A2: Domain-specific intent classes are deferred beyond first increment.

## Acceptance Criteria
- AC-001: Requirements define extraction scope, output expectations, and explicit non-goals.
- AC-002: Requirements define deterministic/offline behavior constraints and downstream integration boundary.
- AC-003: Verification mapping and traceability are complete for implementation handoff.

## Verification Intent Mapping
| Acceptance Criterion | Verification Intent |
| --- | --- |
| AC-001 | RFC review confirms clear in-scope/out-of-scope and signal-contract intent. |
| AC-002 | Planned validation confirms deterministic local extraction behavior and integration-ready output contract. |
| AC-003 | Traceability review confirms PB-0018 intake -> RFC -> planned downstream validation linkage. |

## Requirement Traceability Notes
| Requirement | Traceability |
| --- | --- |
| FR-001, FR-002, NFR-001 | PB-0018 intake problem statement and target outcome |
| FR-003, A1 | PB-0018 intake question on heuristic-first vs model-assisted approach |
| FR-004, A2 | PB-0018 intake question on domain-specific intent classes |
| FR-005 | PB-0018 backlog size policy and parent-scope positioning |
| NFR-002, NFR-003, AC-003 | PB-0018 constraints and offline-first architecture baseline |
