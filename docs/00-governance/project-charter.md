# Project Charter

## Mission
Build `posthaste`, a reliable AI assistant that suggests relevant LinkedIn hashtags from post text.

## Stakeholder Model
- Single stakeholder: `@cpf`.
- Product Owner responsibilities are executed by the Product Owner Agent.
- Agents execute within this charter and `AGENTS.md`.
- Product discovery flow is defined in `docs/00-governance/stakeholder-conversation-protocol.md`.

## Decision Rights
- Product scope, priority, and risk acceptance: stakeholder.
- Technical implementation choices: agents, constrained by approved RFCs.
- Release go/no-go: stakeholder after review evidence.

## Guardrails
- Do not optimize for output volume over relevance.
- Do not merge AI behavior changes without evaluation evidence.
- Do not introduce external integrations without explicit approval.
- MVP platform focus is macOS first; Linux/Windows support is added later unless macOS-first uncovers blocking constraints.
- No budget for paid tooling/services in core development workflow.
- Product dependencies and build/test/security tooling should be open source and usable without paid licenses.
