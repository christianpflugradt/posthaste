# ADR-004: Offline Popularity and Relevance Ranking Strategy

## Status
Accepted

## Context
The product vision requires hashtag suggestions that save user time while balancing relevance and popularity for varied LinkedIn topics (for example tech, careers, events, personal development, employer branding, and broader professional topics).

A pure curated popularity list does not scale well across this topic diversity, while pure frequency-driven scoring can overproduce generic tags.

## Decision
Adopt a hybrid offline ranking strategy for MVP:
- Use small curated popularity priors (generic/high-usage anchors).
- Generate topic-relevant candidate tags from input text via local rules/dataset matching.
- Rank candidates using a balance of relevance and popularity priors.
- Favor mixed outputs (broad + specific) over generic-only outputs.

This strategy is implemented within the Option A architecture from ADR-003 and should remain pluggable for future Option B evolution.

## Consequences
- Positive:
  - better fit for broad LinkedIn topic diversity than curated-only strategy.
  - maintains offline-first behavior with predictable runtime.
  - supports product goal of reducing manual hashtag research time.
- Negative:
  - requires careful tuning of relevance/popularity weighting.
  - curated priors still require occasional maintenance.
- Neutral:
  - future local-model strategy may supersede parts of ranking logic.

## Alternatives Considered
- Curated popularity tiers only: rejected as insufficient for topic variety.
- Pure frequency ranking only: rejected due to generic-tag bias risk.

## Revisit Triggers
Re-evaluate this ADR when one or more occur:
- stakeholder reports persistent relevance or specificity issues.
- ranking consistently over-selects generic tags.
- maintenance burden of curated priors outweighs value.
- Option B local model is introduced.

## Links
- RFC: TBD
- Related ADRs: ADR-003
- Related backlog items: PB-0001, PB-0002
- Related PRs/commits: TBD
