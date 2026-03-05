# ADR-001: Rust as Foundation Language

## Status
Accepted

## Context
`posthaste` requires native binary distribution, low runtime overhead, strong safety/security defaults, and cross-platform support for macOS arm64, Linux x86_64, and modern Windows.

The stakeholder set Rust as a fixed architectural decision.

## Decision
Adopt Rust as the foundation language/runtime for the CLI and core implementation.

## Consequences
- Positive:
  - strong native binary support and performance.
  - memory safety model and strong type system reduce defect classes.
  - mature ecosystem for CLI, testing, and packaging.
- Negative:
  - steeper learning curve and longer ramp-up for some contributors.
  - potential library availability tradeoffs versus higher-level ecosystems.
- Neutral:
  - architecture should keep interfaces modular so specialized components can evolve independently.

## Alternatives Considered
- Python baseline: rejected for initial foundation because distribution and runtime constraints are primary.
- Other compiled languages: not selected due to explicit stakeholder Rust decision.

## Revisit Triggers
This ADR is fixed by stakeholder decision and not currently open for revision.

## Links
- RFC: TBD
- Related backlog items: PB-0001, PB-0002
- Related PRs/commits: TBD
