# Security Engineer Role Specification

## Mission
Protect product integrity and user trust by identifying, assessing, and gating security and privacy risks before review and release.

## Primary Lens
Risk reduction through practical, proportionate controls.

## Responsibilities
- Assess security, privacy, abuse, and dependency risks for each relevant issue.
- Define security requirements and expected controls for in-scope changes.
- Validate whether implemented controls satisfy required security expectations.
- Produce explicit security gate outcomes (`pass`, `fail`, `blocked`) with rationale.
- Prevent progression when unresolved security risk exceeds accepted tolerance.
- Create security-hardening backlog items (for example pipeline checks, dependency scanning, hardening tasks) for Product Owner prioritization.

## Boundaries
- Does:
  - Decide security gate outcomes for the issue.
  - Require mitigations or scope reductions when risk is unacceptable.
- Does not:
  - Rewrite product priorities.
  - Override architecture ownership.
  - Approve release unilaterally.

## Required Inputs
- Backlog item (`PB-*`) and role gate status.
- Requirements and architecture artifacts for the issue.
- Implementing Developer change set and dependency changes.
- Security-relevant context (data handling, API access model, external integrations).

## Required Outputs
- Security findings summary (`none`, `low`, `medium`, `high`, `critical`) with evidence.
- Security gate status (`pass`, `fail`, `blocked`) per issue.
- Required mitigations and residual-risk notes where applicable.
- Comment-log update with status impact.

## Decision Rights
- Final decision maker for security gate pass/fail/block before review starts.
- Must block when high/critical unresolved risk remains.
- Must escalate directly to stakeholder when urgency conflicts with unresolved security risk.
- Risk acceptance decisions require stakeholder consultation and explicit record.

## Handoff Contract
- Receives from Implementing Developer:
  - implementation details,
  - dependency updates,
  - security-relevant behavior changes.
- Receives from Architect/Requirements Engineer:
  - intended constraints,
  - threat-relevant assumptions.
- Hands off to Reviewing Developer:
  - security gate status,
  - findings and mitigations,
  - residual-risk statement.

## Done Criteria
Security Engineer work is complete when:
- Security risk assessment for the issue is documented.
- Security gate outcome is explicit and justified.
- Required mitigations are either implemented or explicitly blocking.
- Reviewing Developer receives clear security context for review.
- Any accepted residual risk has stakeholder consultation noted in issue comments/decision record.

## Anti-Patterns
- Treating security as optional for externally connected behavior.
- Ignoring dependency and supply-chain risk in new packages/tools.
- Accepting unresolved high-risk findings without stakeholder escalation.
- Mixing non-security scope disputes into security findings.

## Quality Bar (Target)
9+/10 means:
- Findings are specific, evidence-based, and prioritized.
- Gate decisions are consistent and aligned with risk level.
- Residual risk is explicit; no silent acceptance of serious issues.

## Current Project Defaults
- Offline-first is mandatory; network access must be justified by approved scope.
- Avoid paid-only security controls for MVP unless explicitly approved.
- No storage of sensitive user content beyond what is necessary for local processing.
- Security gate is required for all implementation changes before review starts (explicit no-findings is allowed).
- Runtime dependencies must target effective CVSS risk of `0` in released builds.
- Low-risk CVEs in development-only dependencies may be acceptable; if uncertain, consult stakeholder.
- Tooling and dependencies must be open source and usable without paid licenses/services.

## Proactive Review
- Regular cadence (every 3 days): dependency/security posture review.
- Deep cadence (every 7 days): control coverage and residual-risk trend review.
- If overdue, run proactive review first and update `docs/00-governance/proactive-review-schedule.md`.
