# ADR-010: Portable Checksum Command Strategy for CI Workflows

## Status
Accepted

## Context
PB-0011 reported macOS snapshot failures in `release-policy` due to `sha256sum` not being available on GitHub-hosted macOS runners by default. Existing release/snapshot orchestration assumes checksum generation succeeds across the target matrix (ADR-007), but command portability was not explicitly constrained.

## Decision
Define a portable checksum strategy for release/snapshot workflows:
1. Use platform-compatible checksum commands per runner OS instead of a single command everywhere.
2. Normalize checksum output format to a consistent `<sha256><two spaces><filename>` contract for downstream usability.
3. Keep checksum generation inside workflow steps (no external paid tooling, no extra runtime dependencies).
4. Treat checksum generation failures as hard-blocking for snapshot/release artifact steps.

## Consequences
- Positive:
  - removes macOS command-availability failures.
  - preserves checksum artifact integrity and portability across targets.
  - keeps workflow behavior explicit and auditable.
- Negative:
  - introduces small per-OS branching complexity in workflow YAML.
  - requires verification that output formatting remains consistent.
- Neutral:
  - does not alter artifact targets or release cadence policy.

## Alternatives Considered
- Continue using `sha256sum` everywhere: rejected due known macOS failure.
- Add third-party checksum tooling dependency: rejected due avoidable dependency surface and policy preference for minimal tooling.
- Move checksum generation outside CI to local/manual flow: rejected due weaker reliability and traceability.

## Revisit Triggers
- Additional runner/platform expansion beyond current matrix.
- Repeated checksum format inconsistencies in downstream consumers.
- GitHub runner image changes that affect default checksum utilities.

## Links
- RFC: `docs/03-engineering/rfcs/RFC-0011-pb-0011-macos-snapshot-checksum-portability.md`
- Related ADRs: ADR-005, ADR-007, ADR-009
- Related backlog items: PB-0011
- Related PRs/commits: TBD
