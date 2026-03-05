# Stakeholder Intake Brief

## Raw Stakeholder Input
Incorporate LinkedIn hashtag popularity signals via API while keeping local usable behavior.

## Why Now
Popularity weighting is a planned MVP differentiator and currently underpowered with static priors.

## Problem Statement
Without fresh popularity ingestion, ranking can drift from current LinkedIn hashtag usage patterns.

## Target User Outcome
Users get relevance plus popularity-informed hashtag ordering with practical local cache behavior.

## Proposed Feature Slice
Add LinkedIn popularity ingestion flow plus local caching/refresh policy to feed ranking.

## Non-Goals
- Always-online dependency.
- Full analytics platform buildout.

## Constraints
- Time: define as parent scope expected to split during RE refinement.
- Quality: avoid degrading offline UX when API data is stale/unavailable.
- Technical: comply with API and caching/security constraints.

## Risks and Unknowns
- API limits/availability may impact refresh cadence.
- Data normalization/versioning strategy needs clear contract.

## Success Signal
Stakeholder confirms popularity-aware outputs better reflect expected LinkedIn tag usage.

## Recommendation
- [x] Proceed to RFC
- [ ] Defer
- [ ] Reject
- [ ] Need clarification

## Questions for Stakeholder
1. What cache freshness target is acceptable for MVP?
2. Should popularity ingestion be manual trigger, scheduled, or hybrid?
