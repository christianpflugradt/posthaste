# Commit Message Guidelines

## Purpose
Define consistent commit message structure for all roles.

## Format
Use Conventional Commit type without scope:

`<type>: <PB-xxxx> <short present-tense summary>`

Examples:
- `feat: PB-0010 add rust hello world binary`
- `fix: PB-0012 handle empty input with non-zero exit`
- `docs: PB-0009 add usage and development sections`

## Types
Use common conventional types:
- `feat`
- `fix`
- `docs`
- `refactor`
- `test`
- `chore`
- `ci`
- `build`
- `perf`

## Rules
- Do not use commit scopes.
- Include backlog item ID when available.
- Prefer multi-line commit messages except for very small changes.
- Subject line should be concise and present tense.
- Body should describe what changed and why.
- Body may use bullet points for clarity.

## Suggested Template
`<type>: <PB-xxxx> <short present-tense summary>`

`<blank line>`

`Detailed description of changes and intent.`
`- Optional bullet point`
`- Optional bullet point`
