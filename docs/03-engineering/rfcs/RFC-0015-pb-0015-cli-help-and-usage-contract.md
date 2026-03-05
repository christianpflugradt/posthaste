# RFC: PB-0015 CLI Help and Usage/Error Contract

## Feature Name
PB-0015 CLI `--help` and usage/error contract baseline

## Problem
CLI discoverability and recovery from invocation errors are inconsistent without explicit help and usage/error contract definitions.

## Proposed Solution
Define requirements for deterministic help output, stable usage semantics, and consistent exit-code/error messaging behavior.

## User Value
First-time users can discover correct invocation quickly and recover from mistakes with clear guidance.

## Scope
- In scope:
  - `--help` output contract and `-h` alias.
  - Usage and error semantics with standard exit-code behavior.
  - Alignment of help contract with README guidance.
- Out of scope:
  - Advanced subcommand framework.
  - Interactive terminal UI.
  - Exhaustive full argument/error matrix documentation in this slice.

## Functional Requirements
- FR-001: CLI supports both `--help` and `-h` to print usage/help text.
- FR-002: Help output includes concise examples plus core argument/option descriptions.
- FR-003: CLI emits consistent error messages for invalid/missing input and references usage guidance.
- FR-004: Exit-code semantics are standardized (success path `0`, usage/input errors non-zero) and documented.
- FR-005: README usage section is aligned with CLI help contract.

## Non-Functional Requirements
- NFR-001: Help and error output remain deterministic/testable.
- NFR-002: Implementation avoids dependency-heavy CLI frameworks unless later justified.
- NFR-003: Requirements and AC trace to PB-0015 intake and parent CLI usability goals.

## Assumptions
- Assumption A1: This slice includes concise examples and core usage contract, not a full exhaustive argument/error matrix.
- Assumption A2: `-h` alias and standard exit-code semantics are included in baseline scope.

## Acceptance Criteria
- AC-001: Requirements explicitly define help invocation surface and usage/error contract boundaries.
- AC-002: Requirements define deterministic output and standardized exit-code behavior.
- AC-003: Verification mapping and traceability are complete for implementation handoff.

## Verification Intent Mapping
| Acceptance Criterion | Verification Intent |
| --- | --- |
| AC-001 | CLI/help review confirms `--help` and `-h` behavior plus required contract sections. |
| AC-002 | Command tests confirm deterministic help/error text and standardized exit-code semantics. |
| AC-003 | Traceability review confirms PB-0015 mapping from intake -> RFC -> planned validation evidence. |

## Requirement Traceability Notes
| Requirement | Traceability |
| --- | --- |
| FR-001, FR-002, A1 | PB-0015 intake question on examples vs full matrix scope |
| FR-003, FR-004, A2 | PB-0015 intake question on `-h` alias and exit-code semantics |
| FR-005 | PB-0015 constraint: align README/help contract |
| NFR-001, NFR-002 | PB-0015 quality/technical constraints |
| NFR-003, AC-003 | PB-0015 parent link and handoff expectations |
