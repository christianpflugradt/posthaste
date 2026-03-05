# Engineering Standards

## Code Quality
- Clear module boundaries and typed interfaces.
- Favor simple, testable functions.
- Avoid hidden side effects.
- Keep external provider logic behind abstractions.

## Testing
- Unit tests for parsing, normalization, and ranking logic.
- Fixture-based tests for end-to-end suggestion behavior.
- Regression tests for previously fixed defects.

## Reliability
- Structured errors with actionable messages.
- Graceful handling for provider failures and invalid model responses.
- Deterministic settings for reproducible evaluation.

## Documentation
- Update docs for behavior/interface changes in the same change set.
- Record major architecture decisions as ADRs.
- Keep examples aligned with actual CLI behavior.

## Change Hygiene
- Keep changes scoped to approved RFC intent.
- Avoid unrelated refactors in feature changes.
- Surface residual risks explicitly in review artifacts.

## Tooling and Dependency Policy
- Prefer open source dependencies and developer tooling.
- Avoid paid-only SaaS/tooling requirements in build, test, and security workflows.
- If a paid tool appears necessary, document alternatives and escalate for stakeholder decision.
