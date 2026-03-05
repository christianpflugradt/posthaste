# AGENTS.md

## Purpose
This file is the execution contract for AI and human contributors in `posthaste`.
It defines roles, handoffs, constraints, and mandatory quality gates.

## Scope
Applies to all repository work: product decisions, design, implementation, review, and release.

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
- After completion and commit decision, stakeholder command `go` starts the next eligible work unit.

## Commit Automation Policy
- File `commit-msg` at repo root stores the commit message for the completed work unit.
- Agent updates `commit-msg` only when the current work unit is fully complete.
- If agent asks questions during the work unit, it does not update `commit-msg` until completion.
- Script `./commit.sh` performs commit and push to `origin/main` using `commit-msg`.
- Commit message content must follow `docs/03-engineering/commit-message-guidelines.md`.
- At end of a completed work unit, agent must offer to run commit:
  - stakeholder `y`: agent runs `./commit.sh`.
  - stakeholder `n`: stakeholder commits manually.
- This policy applies to all roles.

## Interaction Control Policy
- Fresh context start command: `follow prompt.txt as <role>`.
- In active context, if agent is mid-work and asks a question, it resumes the same work unit after stakeholder reply.
- After a work unit is complete, agent asks for commit confirmation (`y`/`n`) per commit policy.
- After commit step (`y` or `n`), stakeholder command `go` means: start the next eligible work unit according to role/backlog/proactive rules.
- Stakeholder command `tasks` means: return a brief list of the next 5 tasks the agent would do (backlog items and/or overdue proactive reviews).
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
3. Implementation and verification.
4. Review and disposition.
5. Release decision and release execution.

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
