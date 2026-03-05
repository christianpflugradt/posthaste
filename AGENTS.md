# AGENTS.md

## Purpose
This file is the execution contract for AI and human contributors in `posthaste`.
It defines roles, handoffs, constraints, and mandatory quality gates.

## Scope
Applies to all repository work: product decisions, design, implementation, review, and release.
Operational quick-reference for active contexts: `docs/00-governance/runtime-contract.md`.
Governance sync contract: `docs/00-governance/governance-sync-map.md`.

## Hybrid Development Model
- Backlog remains the execution source of truth (`backlog/index.md` + issue files).
- OpenSpec artifacts are used for non-trivial change packaging (`openspec/changes/...`).
- Repository skills are reusable execution workflows (`skills/.../SKILL.md`) and should be used when applicable.

## Authority
- Stakeholder: `@cpf`.
- Final decision rights are defined in `docs/00-governance/project-charter.md`.

## Role Activation Protocol
- Every task must start with selecting one primary role before any action is taken.
- Complex tasks may use one secondary role, but one role remains primary and accountable.
- If role context changes mid-task, the change must be explicit in the working notes/artifact.
- For backlog work, role selection and role-state transitions must be recorded in the issue comment log (`backlog/items/PB-*.md`).

## Single-Work-Unit Execution Policy
- An agent in command executes exactly one work unit per prompt.
- A work unit is typically: one role acting on one issue until that role's expected output is complete.
- The agent must complete the unit end-to-end, including required checks for that role.
- Example: Implementing Developer work unit is complete only when implementation is finished and required quality checks for that implementation pass.
- After completion and auto-commit, stakeholder command `go` starts the next eligible work unit.

## Unblock Priority Rule
- If a high-priority item is blocked due to missing evidence/deliverable from an upstream role, and that role is currently able to provide it, that role must prioritize the unblocking work unit before starting unrelated items.
- Roles may move to another item only when:
  - they are not the role capable of unblocking, or
  - a hard blocker prevents unblocking, and the blocker is logged explicitly.

## Commit Automation Policy
- File `commit-msg` at repo root stores the commit message for the completed work unit.
- Agent updates `commit-msg` only when the current work unit is fully complete.
- If agent asks questions during the work unit, it does not update `commit-msg` until completion.
- Script `./commit.sh` performs commit and push to `origin/main` using `commit-msg`.
- Commit message content must follow `docs/03-engineering/commit-message-guidelines.md`.
- Commit message body must include trailer `Role: <Role Name>`.
- At end of a completed work unit, agent runs `./commit.sh` automatically.
- This policy applies to all roles.

## Interaction Control Policy
- Fresh context start command: `follow prompt.txt as <role>`.
- In active context, if agent is mid-work and asks a question, it resumes the same work unit after stakeholder reply.
- After a work unit is complete, agent auto-commits per commit policy.
- After auto-commit, stakeholder command `go` means: start the next eligible work unit for the current role according to role/backlog/proactive rules.
- On every `go`, agents must read `docs/00-governance/runtime-contract.md` and `docs/00-governance/policy-changelog.md` first.
- In active contexts, agents re-read full governance docs (`AGENTS.md`, `backlog/README.md`, `prompt.txt`) only when changelog entries are newer than session last-seen or stakeholder explicitly requests full re-read.
- On every `go`, agents must re-read `backlog/index.md` before selecting the next work unit.
- On every `go`, agents must run `make preflight ROLE="<Current Role>"` before selecting the next work unit.
- Prefer `make go-ready ROLE="<Current Role>"` as the one-command active-context pre-check (runtime references + preflight + governance guard + deterministic tasks list).
- For changes to pickup/preflight behavior, run `make preflight-test` before completion.
- After selecting a candidate item from `backlog/index.md`, agents must re-read that issue file (`backlog/items/PB-*.md`) before taking action.
- In active context, agents must not switch roles implicitly; role changes require explicit stakeholder instruction.
- Stakeholder command `tasks` means: return a brief list of the next 5 tasks the agent would do (backlog items and/or overdue proactive reviews).
- For deterministic backlog listing in active context, use `make tasks ROLE="<Current Role>"`.
- This interaction behavior applies to all roles.

## Proactive Review Policy
- Each role has proactive review responsibilities with fixed cadence.
- Regular cadence is due every 3 days.
- Deep cadence is due every 7 days.
- If a role's proactive review is overdue (`>=3` or `>=7` days), that proactive review work unit must be executed first before normal backlog execution.
- Proactive review state is tracked in `docs/00-governance/proactive-review-schedule.md`.

## Backlog Contribution Policy
- Any role may create backlog items directly for required follow-up work.
- Product Owner prioritizes and orders backlog items; Product Owner is not the default item author.
- Follow-up backlog items must include a parent/backlink to the originating issue.
- Urgent role-created items must include issue-log notification to Product Owner.
- For pickup decisions, agents must use `Next Eligible Role(s)` in `backlog/index.md` as the authoritative selector for the current role; `Role Owner` is informational only.
- When a role updates an issue gate/status in `backlog/items/PB-*.md`, it must update the same issue row in `backlog/index.md` (`Status`, `Next Eligible Role(s)`, `Blocker`, `Updated`) before completing the work unit.
- When a work unit updates policy/process behavior, it must append an entry to `docs/00-governance/policy-changelog.md` in the same work unit.
- For policy/governance updates, run `make governance-guard` before completion.
- Backlog ordering must apply priority-first with aging-aware anti-starvation balancing; do not let newly created higher-priority items indefinitely block older open items without explicit stakeholder direction.

## Backlog Size and Refinement Policy
- Target backlog item size is `1-3 SP`; maximum is `5 SP`.
- Items above `5 SP` must be split before `ready`.
- Product Owner + Requirements Engineer own refinement by default.
- Architect, Security Engineer, and Quality Engineer join refinement when triggered by risk/uncertainty.
- Refinement trigger and participation rules are defined in `backlog/README.md`.

## Backlog Requirement Boundary
- Any change affecting CI/CD pipeline, source code, or build artifact must be linked to an explicit backlog item.
- Markdown-only/process documentation updates may be handled outside explicit backlog items.
- If classification is unclear, the active role must consult stakeholder first, then update its role definition/rules to capture the clarified policy.
- If a change is non-trivial (architecture/cross-cutting/multi-role uncertainty), the active role must create and maintain an OpenSpec package under `openspec/changes/` linked from the backlog issue.

## Role Definitions

### Product Owner Agent
- Leads discovery conversations with the stakeholder for new ideas and feature requests.
- Converts raw requests into a concrete problem statement, target user outcome, success metric, and scoped proposal.
- Decides if a request is a feature, experiment, bugfix, or should be rejected/deferred.
- Owns release timing decisions and snapshot-release policy.

Required outputs:
- Stakeholder intake brief using `templates/stakeholder-intake.md`.
- Prioritized recommendation: proceed, defer, reject, or request clarification.
- If proceeding, handoff package for Architect and Requirements Engineer.
- Release decision record for when/why a new release is created.

### Architect Agent
- Defines system design, module boundaries, interfaces, and technical tradeoffs.
- Produces architecture decisions and technical approach constraints.
- Detailed role spec: `docs/00-governance/roles/architect.md`.

Required outputs:
- ADRs when architecture-impacting decisions are made.
- Technical design notes in RFC/implementation plan.

### Requirements Engineer Agent
- Converts product framing into precise, testable functional and non-functional requirements.
- Owns acceptance criteria clarity and traceability.
- Detailed role spec: `docs/00-governance/roles/requirements-engineer.md`.

Required outputs:
- RFC requirements sections completed.
- Acceptance criteria mapped to verification intent.
- Requirement traceability notes linking criteria to planned validation.

### Quality Engineer Agent
- Defines and validates test strategy, evaluation strategy, and quality gates per change.
- Verifies evidence quality before review/release recommendations.
- Detailed role spec: `docs/00-governance/roles/quality-engineer.md`.

Required outputs:
- Evaluation report (`templates/evaluation-report.md`) for AI-affecting changes.
- Quality gate status summary.

### Security Engineer Agent
- Assesses security, privacy, abuse, and dependency risks.
- Defines security requirements and verifies controls for sensitive changes.
- Detailed role spec: `docs/00-governance/roles/security-engineer.md`.

Required outputs:
- Security findings or explicit no-findings note for relevant changes.
- Security gate decision and stakeholder consultation note for any accepted risk.

### Implementing Developer Agent
- Implements approved scope only.
- Adds/updates tests, docs, and evaluation fixtures as required.
- Produces objective evidence for behavior changes.
- Detailed role spec: `docs/00-governance/roles/implementing-developer.md`.
- Owns transition of issue status to `in-progress` when implementation begins.

Required outputs:
- Code and tests.
- Handoff evidence package for Quality Engineer and Security Engineer.

### Reviewing Developer Agent
- Independent review using `docs/04-quality/review-rubric.md`.
- Prioritizes correctness, regressions, safety, and missing evidence.
- May block progress on unresolved P0/P1 issues.
- Owns transition of issue status to `review` when review begins.
- Detailed role spec: `docs/00-governance/roles/reviewing-developer.md`.

Required outputs:
- Review report using `templates/review-report.md`.

## Workflow Contract
1. Stakeholder intake and product framing.
2. Architecture and requirements specification.
3. OpenSpec packaging for non-trivial changes (proposal/design/tasks/spec-delta).
4. Implementation and verification.
5. Review and disposition.
6. Release decision and release execution.

Detailed phase guidance: `docs/03-engineering/feature-lifecycle.md`.

## Mandatory Gates
- Product Owner intake brief exists for non-trivial requests.
- Backlog item exists and is listed in `backlog/index.md` before implementation starts.
- Approved RFC exists for non-trivial changes.
- Backlog size/refinement policy is satisfied before `ready`.
- Issue status is `ready` as set by Requirements Engineer after Architect + Requirements Engineer completion.
- Tests pass for changed behavior.
- AI-affecting changes include evaluation run against baseline fixtures.
- Security review is completed for all implementation changes (with explicit no-findings allowed).
- No unresolved P0/P1 findings unless explicitly accepted by stakeholder.
- Relevant documentation updated.
- Issue status transitions follow ownership rules in `backlog/README.md` (`done`: Reviewing Developer after stakeholder confirmation; `deferred`: Product Owner).

Reference: `docs/04-quality/quality-gates.md`.

## Non-Negotiables
- No hidden scope changes during implementation.
- No release without traceable review evidence.
- No AI behavior changes without measured evaluation evidence.
- No misleading or spam-oriented user-facing behavior.
- No implementation starts before product framing is complete for new features.
- No paid-only tooling dependency for core development workflow.
- Dependencies and tooling should be open source by default.

## Escalation and Risk Handling
- If constraints are unclear or conflicting, raise to stakeholder.
- Record high-impact architecture decisions as ADRs in `docs/03-engineering/decision-records/`.
- For incidents, follow `docs/05-operations/incident-playbook.md`.

## Definition of Done
A task is done only when:
- Acceptance criteria are met.
- Tests and required evaluations pass.
- Review findings are resolved or explicitly accepted.
- Docs and release notes are updated.
