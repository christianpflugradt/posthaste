# ADR-005: Build and Artifact Matrix

## Status
Accepted

## Context
MVP requires native distribution on macOS arm64, Linux x86_64, and modern Windows, with no cross-compilation helper tooling. CI/CD is GitHub-based and should keep complexity low.

## Decision
Use native builds per target platform via GitHub Actions runners.

Target artifact matrix:
- macOS arm64
- Linux x86_64
- Windows x86_64 (modern)

Artifact policy:
- produce per-target binaries,
- publish checksums with artifacts,
- defer cryptographic signing until key-management policy exists.

## Consequences
- Positive:
  - straightforward build pipeline with lower tooling complexity.
  - better alignment with platform-specific behavior and packaging.
- Negative:
  - dependent on availability/stability of platform runners.
  - potentially longer CI runtime than single-host cross-build.
- Neutral:
  - cross-compilation can be introduced later if constraints change.

## Alternatives Considered
- Cross-compilation helper tooling from start: rejected for MVP.

## Revisit Triggers
- Runner constraints materially impact delivery speed/reliability.
- Platform matrix changes.

## Links
- RFC: TBD
- Related ADRs: ADR-001, ADR-002
- Related backlog items: PB-0002
- Related PRs/commits: TBD
