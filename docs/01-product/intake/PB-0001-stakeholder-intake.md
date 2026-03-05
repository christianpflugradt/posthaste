# Stakeholder Intake Brief

## Raw Stakeholder Input
Build a local CLI tool that suggests relevant and commonly used LinkedIn hashtags from post text.

## Why Now
The stakeholder needs a reliable baseline that removes manual hashtag research and establishes a working offline-first foundation for future enhancement.

## Problem Statement
Solo creators currently spend too much time manually selecting hashtags, with inconsistent quality and no fast local workflow.

## Target User Outcome
A user can provide post text and quickly receive an ordered set of hashtags that are both context-relevant and commonly used on LinkedIn.

## Proposed Feature Slice
Deliver MVP CLI behavior for English input with offline-first ranking that combines curated popularity priors and text relevance, aligned to existing ADR constraints.

## Non-Goals
- Multilingual support in MVP.
- Network-dependent trend lookups.
- JSON-first automation workflow.
- Advanced copy/edit UX beyond plain text output.

## Constraints
- Time: prioritize small slices (1-3 SP) and keep delivery momentum through architecture-derived backlog.
- Quality: maintain objective gates before release (`fmt`, strict `clippy`, `test`, review evidence).
- Technical: Rust-only baseline, GitHub as platform of record, stdlib-first dependency policy, offline-first approach.

## Risks and Unknowns
- Curated hashtag data coverage may be insufficient for some domains.
- Relevance quality depends on early ranking heuristics before broader evaluation data exists.
- File-path-only input may reduce adoption for automation-heavy users until stdin support is prioritized.

## Success Signal
Stakeholder validates that generated hashtag lists are useful for real draft posts and that the CLI flow is fast and predictable enough for repeated use.

## Recommendation
- [x] Proceed to RFC
- [ ] Defer
- [ ] Reject
- [ ] Need clarification

## Questions for Stakeholder
1. What minimum number and maximum number of hashtags should MVP return by default?
2. Should the MVP exclude obviously over-generic tags (for example `#business`) unless relevance is very high?
