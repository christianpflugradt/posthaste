# Stakeholder Intake Brief

## Raw Stakeholder Input
Advance MVP toward local NLP capability by extracting post intent/topics before hashtag ranking.

## Why Now
MVP value depends on better semantic understanding than keyword-only matching.

## Problem Statement
Current hashtag relevance relies on lightweight matching and lacks explicit local NLP intent/topic signals.

## Target User Outcome
Users receive hashtag suggestions grounded in clearer post intent/topic interpretation.

## Proposed Feature Slice
Introduce an offline NLP extraction layer for intent/topic signals and integrate it into downstream ranking inputs.

## Non-Goals
- Cloud NLP dependency.
- Full multilingual NLP support in this phase.

## Constraints
- Time: define as parent scope expected to split during RE refinement.
- Quality: keep deterministic local behavior.
- Technical: preserve offline-first architecture.

## Risks and Unknowns
- Model/heuristic choice may affect performance/complexity tradeoffs.
- Extraction quality thresholds require clear evaluation fixtures.

## Success Signal
Stakeholder observes improved topical relevance on curated real post samples.

## Recommendation
- [x] Proceed to RFC
- [ ] Defer
- [ ] Reject
- [ ] Need clarification

## Questions for Stakeholder
1. Should initial NLP extraction be heuristic-first or model-assisted local inference?
2. Do you want domain-specific intent classes in first increment?
