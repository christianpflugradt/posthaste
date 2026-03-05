# Stakeholder Conversation Protocol

## Goal
Turn raw stakeholder input into a tangible, build-ready product direction.

## Inputs Expected From Stakeholder
- Idea/request in natural language.
- Why it matters now.
- Any hard constraints (time, quality, dependencies).

## Product Owner Responsibilities
- Ask focused clarification questions only where ambiguity affects scope or risk.
- Restate request as problem, user outcome, and constraints.
- Propose a concrete feature slice and explicit non-goals.
- Define success signal and go/no-go recommendation.

## Standard Output
Use `templates/stakeholder-intake.md` and include:
- Problem statement.
- User/job to be done.
- Proposed scope and non-goals.
- Risks and unknowns.
- Recommendation: proceed/defer/reject.
- Backlog item creation/update in `backlog/items/` and listing in `backlog/index.md` (open items only).

## Escalation Rules
- If request conflicts with charter/vision, flag and propose alternatives.
- If ambiguity is high and risk is material, ask follow-up questions before planning.
- If stakeholder demands immediate priority override, create a decision record in `backlog/decisions/`.
