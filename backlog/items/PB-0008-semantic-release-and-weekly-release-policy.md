# PB-0008: Semantic-release and weekly release policy

## Source
- Parent item: PB-0002.
- Derived from ADR-007.

## Parent Link
- PB-0002

## Problem Statement
Release orchestration needs automation and clear governance consistent with PO ownership and weekly cadence.

## Desired Outcome
Semantic-release workflow is integrated with:
- PO-controlled formal release timing,
- weekly release window (Sunday night to Monday),
- continuous snapshot artifact publication.

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
| Product Owner | pending | 2026-03-05 | Release ownership/policy already defined. |
| Architect | done | 2026-03-05 | Orchestration policy defined in ADR-007. |
| Requirements Engineer | pending | 2026-03-05 | Not started. |
| Quality Engineer | pending | 2026-03-05 | Not started. |
| Security Engineer | pending | 2026-03-05 | Not started. |
| Implementing Developer | pending | 2026-03-05 | Not started. |
| Reviewing Developer | pending | 2026-03-05 | Not started. |

## Constraints
- formal releases are not on every push.
- snapshot naming includes traceability.

## Recommendation
- Proceed.

## Acceptance Signal
- Snapshot and release channels operate according to policy.

## Handoff Target
- Product Owner -> Requirements Engineer + Architect.

## Blocking Conditions
- Requires `ready` transition by Requirements Engineer.

## Issue Comment Log
| Time | Role | Type | Note | Status Impact |
| --- | --- | --- | --- | --- |
| 2026-03-05 11:45 | Architect | status | Derived implementation slice from architecture decisions. | Architect: done |
