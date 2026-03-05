# DEC-0002: Priority override for macOS snapshot checksum fix

## Type
- Stakeholder override

## Related Items
- PB-0011

## Context
Stakeholder reported active release-policy workflow failure on macOS runners caused by unavailable `sha256sum` command in snapshot checksum step.

## Decision
Create PB-0011 and move it to top backlog priority as `P0` so refinement and delivery start immediately.

## Tradeoffs
- Temporarily interrupts planned sequencing of other in-flight high-priority items.
- Removes ongoing release workflow failure that affects repeated commits.

## Risks Accepted
- Short-term context switching across roles to absorb urgent bugfix work.

## Effective Date
- 2026-03-05

## Approved By
- Stakeholder: @cpf
