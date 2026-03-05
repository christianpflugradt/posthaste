# posthaste

`posthaste` is a Rust-based CLI project that will suggest relevant LinkedIn hashtags from post text.

The product is designed to be:
- offline-first,
- low-overhead on average developer machines,
- distributed as native binaries,
- developed through role-based agentic workflows.

## Current Goal
Build a reliable technical foundation first (hello-world app + CI/CD + quality gates + release/snapshot pipeline), then iterate toward full hashtag intelligence.

## Architecture Baseline
- Language: Rust
- Platform of record: GitHub
- Build targets: macOS arm64, Linux x86_64, Windows x86_64
- QA baseline: `cargo fmt --check`, `cargo clippy -- -D warnings`, `cargo test`
- Release model: continuous snapshots + PO-controlled formal weekly releases

See ADRs in:
- `docs/03-engineering/decision-records/`

## How To Work With Agents

### Fresh AI Context
Start with:

```text
follow prompt.txt as <role>
```

Roles:
- Product Owner
- Architect
- Requirements Engineer
- Quality Engineer
- Security Engineer
- Implementing Developer
- Reviewing Developer

### Active AI Context
- If the agent asks a question while working, answer it; the agent should continue the same work unit.
- When the agent finishes a work unit, it auto-runs `./commit.sh` (commit + push to `origin/main`).
- After that, prompt:

```text
go
```

to start the next eligible work unit.
- Prompt:

```text
tasks
```

to get a brief list of the next 5 tasks the agent would do (backlog and/or overdue proactive reviews).

## Commit Workflow
- `commit-msg` holds the commit message for a completed work unit.
- `commit.sh` commits all staged changes and pushes to `origin/main`.
- Commit message format follows:
  - `docs/03-engineering/commit-message-guidelines.md`

## Governance and Process
Start here:
- `AGENTS.md`
- `backlog/README.md`
- `docs/README.md`
- `prompt.txt`
