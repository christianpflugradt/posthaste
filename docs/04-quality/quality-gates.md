# Quality Gates

## Merge Gates (Required)
- Relevant unit/integration tests pass.
- Lint/type checks pass (when configured).
- Reviewer confirms no unresolved P0/P1 findings.
- Docs updated when behavior/interfaces change.

## AI Change Gates (Required)
- Evaluation suite executed against baseline fixtures.
- No unacceptable regression in relevance/format validity.
- Any intentional behavior change documented in RFC/release notes.

## Release Gates (Required)
- Merge gates satisfied.
- Release checklist completed.
- Rollback path documented and validated.
- Verifiable working snapshot artifact available from CI for the release candidate commit.
