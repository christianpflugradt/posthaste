# PB-0007: Release artifacts and checksums

## Source
- Parent item: PB-0002.
- Derived from ADR-005, ADR-007.

## Parent Link
- PB-0002

## Problem Statement
Users need downloadable binaries with integrity verification from day one.

## Desired Outcome
GitHub release artifacts include per-target binaries and checksum files.

## Vision Alignment
- High.

## Priority
- P0.

## Story Points
- 3

## Status
- intake.

## Role Gate Matrix
| Role | State | Updated | Notes |
| --- | --- | --- | --- |
| Product Owner | pending | 2026-03-05 | Awaiting prioritization. |
| Architect | done | 2026-03-05 | Artifact policy defined. |
| Requirements Engineer | pending | 2026-03-05 | Not started. |
| Quality Engineer | pending | 2026-03-05 | Not started. |
| Security Engineer | pending | 2026-03-05 | Signing deferred by policy. |
| Implementing Developer | pending | 2026-03-05 | Not started. |
| Reviewing Developer | pending | 2026-03-05 | Not started. |

## Constraints
- signing deferred until key-management policy exists.

## Recommendation
- Proceed.

## Acceptance Signal
- Release assets include binaries and checksums for supported targets.

## Handoff Target
- Product Owner -> Requirements Engineer + Architect.

## Blocking Conditions
- Requires `ready` transition by Requirements Engineer.

## Issue Comment Log
| Time | Role | Type | Note | Status Impact |
| --- | --- | --- | --- | --- |
| 2026-03-05 11:45 | Architect | status | Derived implementation slice from architecture decisions. | Architect: done |
