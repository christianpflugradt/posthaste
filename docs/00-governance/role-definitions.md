# Role Definitions

## Stakeholder
- Provides raw ideas, constraints, and priorities.
- Approves product direction, risk acceptance, and release go/no-go.

## Product Owner Agent
- Runs structured discovery conversations with the stakeholder.
- Converts vague requests into tangible, scoped product opportunities.
- Produces intake brief and recommendation to proceed/defer/reject.
- Owns release planning and decides when a new release is created.
- Owns snapshot policy to ensure there is always a verifiable working snapshot build.
- Co-owns refinement with Requirements Engineer.
- Detailed spec: `docs/00-governance/roles/product-owner.md`.

## Architect Agent
- Converts approved intake into technical design and architecture choices.
- Defines boundaries, interfaces, dependencies, and technical constraints.
- Detailed spec: `docs/00-governance/roles/architect.md`.

## Requirements Engineer Agent
- Converts product framing into specific, testable requirements.
- Maintains requirement traceability to acceptance criteria and verification.
- Owns `ready` status transition once Architect + Requirements Engineer gates are complete.
- Co-owns refinement with Product Owner.
- Detailed spec: `docs/00-governance/roles/requirements-engineer.md`.

## Quality Engineer Agent
- Owns test/evaluation strategy and quality gate evidence.
- Confirms objective quality status before release recommendation.
- Detailed spec: `docs/00-governance/roles/quality-engineer.md`.

## Security Engineer Agent
- Owns security and privacy review for relevant features/changes.
- Reports risks, required mitigations, and residual risk.
- Consults stakeholder for accepted-risk decisions and records outcomes.
- Creates security backlog items for Product Owner prioritization when needed.
- Detailed spec: `docs/00-governance/roles/security-engineer.md`.

## Implementing Developer Agent
- Delivers approved scope with tests, docs, and evidence.
- Owns transition to `in-progress` when implementation starts.
- Detailed spec: `docs/00-governance/roles/implementing-developer.md`.

## Reviewing Developer Agent
- Independently assesses correctness, regressions, and risk.
- Blocks on unresolved high-severity issues.
- Owns transition of issue status to `review` when review starts.
- Owns transition to `done` after stakeholder confirms no further action.
- Can request direct rework from Implementing Developer.
- Detailed spec: `docs/00-governance/roles/reviewing-developer.md`.

## Product Owner Status Ownership
- Owns transition of issues to `deferred`.
- Owns archive moves for `done` and `deferred` items.
- Owns release creation timing and release/snapshot sequencing.

## Handoff Contract
1. Stakeholder -> Product Owner: raw request/idea.
2. Product Owner -> Architect + Requirements Engineer: intake brief and recommendation.
3. Architect + Requirements Engineer -> Implementing Developer: approved design + requirements package.
4. Implementing Developer -> Quality Engineer + Security Engineer: implementation and evidence package.
5. Quality Engineer + Security Engineer -> Reviewing Developer: gate status and findings.
6. Reviewing Developer -> Stakeholder: review disposition and release recommendation.

## Execution Scope
- Execution scope is one role-level work unit on one issue per prompt.
- Next eligible work unit follows `backlog/index.md` order; if role contribution is not possible on an item, log and move to the next eligible item.
- Any CI/CD, source code, or build artifact change requires explicit backlog-item linkage.
- Markdown-only/process documentation updates may be executed without explicit backlog items.
- If uncertain about boundary classification, consult stakeholder and update relevant role definitions/rules afterward.
- All roles must check proactive review cadence in `docs/00-governance/proactive-review-schedule.md` before normal execution.
- If proactive review is overdue (regular >=3 days, deep >=7 days), execute it first.
