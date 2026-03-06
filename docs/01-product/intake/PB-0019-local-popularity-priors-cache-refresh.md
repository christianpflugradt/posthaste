# Stakeholder Intake Brief

## Raw Stakeholder Input
Incorporate popularity signals without LinkedIn API/scraping dependency, using compliant local priors and refreshable curated data.

## Why Now
Popularity weighting is still useful, but current product direction must avoid unverified API assumptions and scraping risk.

## Problem Statement
Without maintainable local popularity priors, ranking can drift and overfit relevance-only signals.

## Target User Outcome
Users get relevance plus popularity-informed hashtag ordering from compliant local data.

## Proposed Feature Slice
Define and implement curated popularity-prior data flow with local cache/refresh policy (no LinkedIn API/scraping dependency).

## Non-Goals
- Always-online dependency.
- Full analytics platform buildout.

## Constraints
- Time: define as parent scope expected to split during RE refinement.
- Quality: avoid degrading offline UX when API data is stale/unavailable.
- Technical: no scraping and no hard dependency on unavailable/unsupported LinkedIn API endpoints.

## Risks and Unknowns
- Curated prior freshness cadence may lag market shifts.
- Data normalization/versioning strategy needs clear contract.

## Success Signal
Stakeholder confirms popularity priors improve ordering quality relative to pure relevance baseline.

## Recommendation
- [x] Proceed to RFC
- [ ] Defer
- [ ] Reject
- [ ] Need clarification

## Questions for Stakeholder
1. What cache freshness target is acceptable for MVP?
2. Should prior updates be manual trigger, scheduled, or hybrid?
