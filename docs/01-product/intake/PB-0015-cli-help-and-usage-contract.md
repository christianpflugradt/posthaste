# Stakeholder Intake Brief

## Raw Stakeholder Input
Improve CLI UX with explicit `--help` and stable usage/error contract.

## Why Now
Usability improvements are needed as baseline engineering work stabilizes and user adoption starts.

## Problem Statement
Current UX is functional but lacks explicit discoverability and standardized help semantics.

## Target User Outcome
Users can understand invocation quickly and recover from input mistakes with clear usage guidance.

## Proposed Feature Slice
Add `--help` output, documented usage contract, and consistent error messaging conventions.

## Non-Goals
- Advanced subcommand framework.
- Interactive terminal UI.

## Constraints
- Time: keep to clear MVP-friendly CLI ergonomics.
- Quality: help and errors must be deterministic/testable.
- Technical: avoid adding unnecessary dependencies.

## Risks and Unknowns
- Help text contract may require future migration handling.
- Edge-case invocation behavior needs explicit requirements.

## Success Signal
Stakeholder confirms first-time CLI discoverability and invocation clarity are improved.

## Recommendation
- [x] Proceed to RFC
- [ ] Defer
- [ ] Reject
- [ ] Need clarification

## Questions for Stakeholder
1. Should `--help` include examples only, or full argument/error matrix?
2. Do you want `-h` alias and standard exit-code semantics included in this slice?
