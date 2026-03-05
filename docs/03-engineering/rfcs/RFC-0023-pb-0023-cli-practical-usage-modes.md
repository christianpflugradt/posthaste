# RFC: PB-0023 CLI Practical Usage Modes and Output Context

## Feature Name
PB-0023 CLI practical usage modes and output context improvements

## Problem
Minimal CLI interaction slows repeated local drafting workflows and provides limited operational context.

## Proposed Solution
Define requirements for practical invocation modes and optional context output while preserving backward-compatible baseline behavior.

## User Value
Users can run common local workflows faster with clearer, actionable output.

## Scope
- In scope:
  - Practical mode prioritization for near-term CLI usage.
  - Backward-compatible option and output-context contract.
  - Deterministic/testable behavior for new modes.
- Out of scope:
  - GUI application.
  - Hosted API/service mode.

## Functional Requirements
- FR-001: First practical mode priorities are stdin support and verbosity controls.
- FR-002: Existing baseline file-path invocation remains backward compatible.
- FR-003: Optional explanation/confidence annotations are included in this phase behind explicit flag/control.
- FR-004: Added modes/options include clear usage/help contract updates.
- FR-005: Output context remains concise by default; additional detail is opt-in.

## Non-Functional Requirements
- NFR-001: CLI behavior remains deterministic and testable across mode variants.
- NFR-002: Option surface growth remains disciplined with coherent naming/semantics.
- NFR-003: Requirements and AC trace to PB-0023 intake and parent usability goal.

## Assumptions
- Assumption A1: Prioritize stdin and verbosity controls first (batch mode deferred).
- Assumption A2: Explanation/confidence annotations are included as optional output in this increment.

## Acceptance Criteria
- AC-001: Requirements explicitly define prioritized practical modes and backward-compatibility boundaries.
- AC-002: Requirements define output-context default vs opt-in behavior and readability constraints.
- AC-003: Verification mapping and traceability are complete for implementation handoff.

## Verification Intent Mapping
| Acceptance Criterion | Verification Intent |
| --- | --- |
| AC-001 | CLI contract review/tests confirm stdin+verbosity priorities and unchanged baseline invocation behavior. |
| AC-002 | Output checks confirm concise default output with optional explanation/confidence annotations under explicit control. |
| AC-003 | Traceability review confirms PB-0023 mapping from intake -> RFC -> planned validation evidence. |

## Requirement Traceability Notes
| Requirement | Traceability |
| --- | --- |
| FR-001, A1 | PB-0023 intake question on batch/stdin/verbosity prioritization |
| FR-002, FR-004 | PB-0023 constraint to avoid breaking existing invocation behavior |
| FR-003, A2 | PB-0023 intake question on optional explanation/confidence annotations |
| FR-005, NFR-001 | PB-0023 risk note on readability overload and determinism requirement |
| NFR-002, NFR-003, AC-003 | PB-0023 technical constraint and handoff expectations |
