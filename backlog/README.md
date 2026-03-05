# Backlog Operating Model

## Purpose
This backlog is the single source of truth for active product work.

## Scope
- Open work only is listed in `backlog/index.md`.
- Every stakeholder request creates a formal backlog item.
- Stakeholder priority overrides always create a decision record.
- Any CI/CD, source code, or build artifact change must stem from a backlog item.
- Markdown-only/process documentation updates may be handled outside explicit backlog items.

## IDs
- Backlog items: `PB-0001`, `PB-0002`, ...
- Decisions: `DEC-0001`, `DEC-0002`, ...

## Priority
- `P0`: urgent and immediately actionable.
- `P1`: high priority.
- `P2`: normal priority.
- `P3`: low priority.

## Size Policy
- Target backlog item size is `1-3 SP`.
- Maximum allowed size is `5 SP`.
- No stakeholder acknowledgment is required for `5 SP` items.
- Items estimated above `5 SP` must be split before `ready`.
- Items mixing separable concerns must be split if separation does not reduce delivery efficiency.
- Child items created by splitting must reference parent/backlink.

## Status Flow
`intake -> shaped -> ready -> in-progress -> review -> done -> deferred`

## Open vs Archived
- `backlog/index.md` contains only open items (`intake`, `shaped`, `ready`, `in-progress`, `review`).
- Completed items are moved to `backlog/archive/done/YYYY-MM/`.
- Deferred items are moved to `backlog/archive/deferred/YYYY-MM/`.
- Archive move happens immediately when status becomes `done` or `deferred`.
- Product Owner is responsible for archive moves.

## Ordering
- `backlog/index.md` is manually ordered by Product Owner judgment (not auto-sorted).

## Index Columns
- `Role Owner` is informational and may reflect the role that most recently drove status progression.
- `Next Eligible Role(s)` is authoritative for agent pickup.
- `Blocker` captures why other roles are not currently eligible.
- `Updated` must be refreshed when status/gate state changes alter eligibility.

## Required Artifacts Per Item
- Backlog item file in `backlog/items/` using `templates/backlog-item.md`.
- Stakeholder intake reference.
- Priority and status.
- Recommendation rationale.
- Parent/backlink reference is required for follow-up items (for example `Parent: PB-0007`).

## Backlog Contribution Rules
- Each role may create backlog items directly when it identifies required follow-up work.
- Product Owner prioritizes and orders created items; Product Owner is not the default item author.
- Urgent role-created items must include an issue-log note notifying Product Owner.
- Security Engineer creates security-hardening/security-risk items directly when needed.
- If a role is unsure whether work requires a backlog item, it must consult stakeholder and then update the relevant role definition/rules with the clarified boundary.

## Refinement Protocol
- Primary owners: Product Owner + Requirements Engineer.
- Refinement goal: produce small, testable, role-ready backlog items.
- Refinement is required before an item can move to `ready`.

## Refinement Triggers
- Item estimate is above `5 SP`.
- Item combines multiple separable outcomes/concerns.
- Acceptance criteria are ambiguous or not testable.
- Architecture, security, or quality risk is unclear.

## Refinement Participation Rules
- Product Owner participates always.
- Requirements Engineer participates always.
- Architect participates when design/interface/tradeoff decisions are required.
- Security Engineer participates when dependency, data, integration, or abuse risk is present.
- Quality Engineer participates when validation strategy or regression risk is unclear.

## Refinement Exit Criteria
- Size policy satisfied (`<=5 SP` and preferably `1-3 SP`).
- Scope boundaries and acceptance criteria are clear and testable.
- Required role participants (if triggered) have provided input.
- Split decisions and parent/backlinks are recorded when applicable.

## Stakeholder Override Rule
If stakeholder requests immediate implementation against current priority, create a decision record in `backlog/decisions/` using `templates/backlog-decision.md`.

## Communication Model
- Communication is per issue and lives in the backlog item file itself.
- Do not create a separate communication folder for normal operations.
- Each role writes append-only comments in the issue comment log.

## Role Gate Matrix (Per Issue)
Each backlog item must include role gates with states:
- `pending`: role has not started.
- `in-progress`: role currently active.
- `done`: role completed required output.
- `blocked`: role cannot proceed; blocker must be documented.

Required role gates:
- Product Owner
- Architect
- Requirements Engineer
- Quality Engineer
- Security Engineer
- Implementing Developer
- Reviewing Developer

## Blocking Rules
- If Architect is `blocked` or not `done`, the issue cannot be marked `ready`.
- `ready` transition is owned by Requirements Engineer after confirming Architect and Requirements Engineer are both `done`.
- Implementation can start only when Architect and Requirements Engineer are `done`.
- `in-progress` transition is owned by Implementing Developer when implementation begins.
- If material requirement ambiguity exists, implementation is blocked until resolved.
- Implementing Developer completion requires required implementation checks to pass before QE/Security handoff.
- Missing small requirement detail may proceed only with minimal-assumption proposal explicitly confirmed by Requirements Engineer in issue comments.
- New dependencies require Security Engineer pre-check before addition.
- Review can start only when Implementing Developer, Quality Engineer, and Security Engineer are `done` for implementation issues.
- Quality Engineer owns quality-gate pass/fail/block decision before review starts.
- Security Engineer owns security-gate pass/fail/block decision before review starts.
- Quality Engineer and Security Engineer are parallel-eligible when both gates are pending in `in-progress` state; no ordering is required between them.
- `review` becomes eligible only when all required pre-review gates are `done`.
- `review` status transition is owned by Reviewing Developer.
- Reviewing Developer blocks disposition on unresolved `P0`/`P1` findings unless stakeholder explicitly accepts risk.
- `P2`/`P3` findings may be approved with follow-ups; follow-ups must be added as backlog items for Product Owner prioritization.
- Major architecture concerns found during review should be escalated to Architect for confirmation before blocking unless immediate risk is present.
- Flaky/intermittent required tests are treated as blocking until stable pass evidence is available.
- Minimum required checks are defined by issue risk (not one fixed global checklist).
- Accepted security risk requires stakeholder consultation and explicit issue/decision log record.

## Blocker Ownership Rule
- When the highest-priority open item has a blocker, the role capable of providing the missing deliverable owns the next work unit for that blocker, even if that role gate was previously `done`.
- In that case, the role re-opens its gate (`in-progress`) for blocker resolution, logs the unblock action, and completes the missing deliverable before taking unrelated items.
- If blocker ownership is ambiguous, consult stakeholder immediately and record the decision in the issue comment log.

## Status Ownership
- `done` transition is owned by Reviewing Developer after stakeholder confirms no further action is required.
- `deferred` transition is owned by Product Owner only.
- Any role may set its own role gate state to `blocked`; Product Owner owns resulting priority/order changes.

## Comment Entry Format
Use one entry per update:
- Timestamp (`YYYY-MM-DD HH:MM` local time)
- Role
- Type (`decision`, `question`, `risk`, `handoff`, `blocker`, `status`)
- Note (short, concrete)
- Status impact (which gate changed)

## Agent Pickup Rule
Before acting, an agent must:
1. Read the issue role gate matrix and latest comments.
2. Confirm their role is `in-progress` or transition it from `pending`.
3. Add a comment for any status transition.

## Work Unit Scope Rule
- Scope is one work unit per prompt.
- Work unit definition: one role completing its contribution for one issue.
- Role completion must satisfy that role's gate expectations before moving to another issue.
- Proactive review work units are valid scheduled work units and should run first when overdue per `docs/00-governance/proactive-review-schedule.md`.

## Processing Order Rule
- Next eligible work unit is selected from `backlog/index.md` order.
- Order authority belongs to Product Owner.
- Agents must select work by `Next Eligible Role(s)` in index order; `Role Owner` is informational only.
- If the active role cannot contribute to the current issue, document the reason in that issue comment log and select the next eligible issue in index order.
- If the current issue is blocked by a missing deliverable that the active role can provide, the active role must prioritize unblocking that issue before taking unrelated work.

## Interaction Commands
- `go`: execute the next eligible work unit.
- `tasks`: return a brief, concise list of the next 5 tasks (backlog items and/or overdue proactive reviews).
