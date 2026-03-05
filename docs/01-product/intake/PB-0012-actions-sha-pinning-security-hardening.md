# Stakeholder Intake Brief

## Raw Stakeholder Input
Harden CI/release workflow supply chain by pinning all GitHub Actions to commit SHAs.

## Why Now
Residual risk from version-tag action references is repeatedly noted in security reviews and should be reduced before scale.

## Problem Statement
Workflow actions currently use moving tags, which can introduce unexpected upstream changes.

## Target User Outcome
Build and release automation remains reproducible and less exposed to third-party action supply-chain drift.

## Proposed Feature Slice
Pin all GitHub Actions used in workflows to immutable commit SHAs and document update policy.

## Non-Goals
- Replacing GitHub Actions ecosystem.
- Introducing paid security tooling.

## Constraints
- Time: keep as a focused hardening slice.
- Quality: workflow behavior must remain unchanged except pinning.
- Technical: preserve compatibility with existing workflows.

## Risks and Unknowns
- SHA pin updates require periodic maintenance cadence.
- Incorrect pin selection can break workflows.

## Success Signal
Stakeholder confirms workflows are SHA-pinned and still execute successfully.

## Recommendation
- [x] Proceed to RFC
- [ ] Defer
- [ ] Reject
- [ ] Need clarification

## Questions for Stakeholder
1. Should pin refresh happen on a fixed cadence (for example monthly) or ad hoc?
2. Do you want a dedicated follow-up story for pin refresh automation?
