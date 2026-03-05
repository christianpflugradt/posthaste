# ADR-003: Offline Hashtag Intelligence Strategy for MVP

## Status
Accepted

## Context
`posthaste` MVP must be offline-first, low-footprint, cross-platform (macOS arm64, Linux x86_64, modern Windows), and fast to distribute as native binaries.

We evaluated two approaches for generating hashtag suggestions from local text input:
- Option A: rules + static curated hashtag datasets bundled with the binary.
- Option B: embedded local ML/NLP model bundled with the binary.

The stakeholder requested that MVP starts with Option A, while preserving an explicit path to Option B later, potentially configurable.

## Decision
Adopt Option A for MVP:
- implement local rules + curated static hashtag data as the default strategy.
- design a common strategy interface for hashtag intelligence.
- keep implementation loosely coupled so strategy implementations can be swapped.
- plan for future Option B implementation behind the same interface.
- allow future configurability to choose strategy (A/B) once Option B exists.

## Consequences
- Positive:
  - lower delivery and operational risk for MVP.
  - smaller complexity and easier cross-platform packaging.
  - fast startup and predictable runtime resource usage.
  - clear extensibility path via strategy abstraction.
- Negative:
  - lower semantic sophistication initially.
  - more manual curation effort for hashtag datasets/rules.
- Neutral:
  - future Option B remains viable and intentionally deferred.

## Alternatives Considered
- Option B first (embedded local model): rejected for MVP due to higher packaging/runtime/maintenance complexity and larger artifact footprint.

## Revisit Triggers
Re-evaluate this ADR when one or more occur:
- relevance quality plateaus with Option A despite reasonable iteration.
- dataset/rule maintenance overhead outweighs Option A simplicity.
- artifact size/performance budgets can accommodate embedded models.
- stakeholder requests configurable strategy selection.

## Links
- RFC: TBD
- Related backlog items: PB-0001, PB-0002
- Related PRs/commits: TBD
