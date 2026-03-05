# Stakeholder Intake Brief

## Raw Stakeholder Input
Add GitHub Actions matrix builds on native runners for macOS arm64, Linux x86_64, and Windows x86_64.

## Why Now
The roadmap requires early confidence that supported targets build successfully without introducing cross-compilation helper tooling.

## Problem Statement
Without target-matrix CI evidence, platform-specific build breaks can go undetected until late release steps.

## Target User Outcome
Contributors and stakeholder can trust that every merged change is validated across the supported OS/architecture matrix.

## Proposed Feature Slice
Implement CI workflow jobs on native GitHub-hosted runners for the three supported targets, aligned with current ADR constraints and QA gate order.

## Non-Goals
- Cross-compilation toolchain setup.
- Artifact signing pipeline.
- Additional target expansion beyond current matrix.

## Constraints
- Time: keep this as a focused 3 SP slice.
- Quality: matrix jobs should be deterministic and blocking on failure.
- Technical: GitHub as platform of record; no cross-compilation helper tooling.

## Risks and Unknowns
- Runner availability and OS-specific dependency behavior may affect workflow stability.
- Windows shell/tooling differences can introduce intermittent command issues.

## Success Signal
Stakeholder confirms CI matrix coverage is sufficient for supported targets and catches platform regressions early.

## Recommendation
- [x] Proceed to RFC
- [ ] Defer
- [ ] Reject
- [ ] Need clarification

## Questions for Stakeholder
1. Should matrix failures block all merges immediately, or allow temporary soft-fail during bootstrap?
2. Do you want per-target build logs/artifacts retained for debugging in this slice or deferred?
