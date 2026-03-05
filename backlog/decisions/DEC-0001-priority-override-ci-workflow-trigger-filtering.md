# DEC-0001: Priority override for CI workflow trigger filtering

## Type
- Stakeholder override

## Related Items
- PB-0010

## Context
Stakeholder raised a high-priority issue that current workflow triggers run redundant workflows on nearly every commit, including changes in non-impacting directories.

## Decision
Create PB-0010 and place it at the top of `backlog/index.md` as highest-priority `P0` work so Requirements Engineer refinement can start immediately.

## Tradeoffs
- Short-term sequencing disruption for currently in-flight lower-impact units.
- Faster reduction in ongoing CI noise/cost and improved signal quality for future commits.

## Risks Accepted
- Temporary reprioritization overhead while role owners rebalance around PB-0010.

## Effective Date
- 2026-03-05

## Approved By
- Stakeholder: @cpf
