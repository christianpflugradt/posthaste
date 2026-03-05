# Stakeholder Intake Brief

## Raw Stakeholder Input
Build the planned hybrid ranking version that combines NLP relevance with LinkedIn popularity.

## Why Now
This is core MVP product logic and central to stakeholder success criteria.

## Problem Statement
Existing ranking does not yet integrate richer NLP and refreshed popularity signals in a cohesive scoring model.

## Target User Outcome
Users receive ordered hashtags that better balance semantic relevance and real-world popularity.

## Proposed Feature Slice
Define and implement hybrid ranking v2 scoring contract using NLP extraction outputs and popularity inputs.

## Non-Goals
- Fully automated model training pipeline.
- Personalization by user account history.

## Constraints
- Time: define as parent scope expected to split during RE refinement.
- Quality: ranking changes require measurable evaluation against baseline fixtures.
- Technical: preserve deterministic offline execution for core use path.

## Risks and Unknowns
- Weight tuning can overfit small fixture sets.
- Ranking interpretability may drop without explanation outputs.

## Success Signal
Stakeholder confirms improved ranking usefulness on curated benchmark posts.

## Recommendation
- [x] Proceed to RFC
- [ ] Defer
- [ ] Reject
- [ ] Need clarification

## Questions for Stakeholder
1. Should v2 include configurable weighting from day one?
2. What minimum measured lift threshold should gate rollout?
