# OpenSpec Hybrid Model

This repository uses a hybrid operating model:
- Backlog-first execution and role gates (`backlog/index.md`, `backlog/items/PB-*.md`).
- OpenSpec change artifacts for non-trivial design work.

The backlog remains the execution queue and source of truth for "what runs next."
OpenSpec artifacts are the design/change package attached to a backlog item.

## When OpenSpec Is Required
Create an OpenSpec change package when any of the following is true:
- Architecture-impacting or cross-cutting change.
- Multi-role uncertainty (Product/Requirements/Architecture/Quality/Security).
- Scope is non-trivial and benefits from explicit proposal/design/tasks/spec deltas.

OpenSpec is optional for small, local changes that are already unambiguous from backlog + RFC artifacts.

## Directory Structure
- `openspec/changes/<change-id>/proposal.md`
- `openspec/changes/<change-id>/design.md`
- `openspec/changes/<change-id>/tasks.md`
- `openspec/changes/<change-id>/spec-delta.md`

Use templates under `openspec/templates/`.

## Naming Convention
- Change id: `chg-<pb-id>-<short-kebab-title>`
- Example: `chg-pb-0012-cli-json-output`

## Mapping to Backlog
- Backlog item must link the corresponding OpenSpec change path in issue comments.
- OpenSpec `tasks.md` should reference backlog roles and acceptance checks.
- If requirements/design change materially, update RFC/ADR as part of the same change set.
