# posthaste

`posthaste` is an offline-first Rust CLI that suggests relevant LinkedIn hashtags from post text.

## Quick Start (Users)
1. Put your draft post text in a file.
2. Run:

```bash
cargo run -- path/to/post.txt
```

The CLI prints an ordered hashtag list (plain text, one hashtag per line).

Baseline invocation (no args):

```bash
cargo run
```

returns `hello from posthaste`.

## Contributor Setup
Prerequisites:
- Rust toolchain (`rustup`, `cargo`)
- Git

Typical setup flow:

```bash
cargo build
cargo test
```

## Architecture Baseline
- Language: Rust
- Platform of record: GitHub
- Build targets: macOS arm64, Linux x86_64, Windows x86_64
- QA baseline: `cargo fmt --check`, `cargo clippy -- -D warnings`, `cargo test`
- Release model: continuous snapshots + PO-controlled formal weekly releases

See ADRs in:
- `docs/03-engineering/decision-records/`

## QA Pre-Flight
Required local command order:

```bash
cargo fmt --check
cargo clippy -- -D warnings
cargo test
```

Equivalent shortcut:

```bash
make check
```

## Snapshot and Formal Releases
- Snapshots:
  - Published continuously from `main` with traceable identifiers.
  - Intended to provide verifiable working artifacts between formal releases.
- Formal releases:
  - Semver-tagged and Product Owner controlled.
  - Weekly default window is Sunday night to Monday, with explicit override path.

Reference docs:
- `docs/05-operations/release-playbook.md`
- `docs/03-engineering/decision-records/ADR-007-release-and-snapshot-orchestration.md`
- `docs/03-engineering/decision-records/ADR-005-build-and-artifact-matrix.md`

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

to start the next eligible work unit for the current role (no implicit role switch).
- To run continuously until work is exhausted, prompt:

```text
go all
```

`go all` repeats `go` units and stops on no eligible work, hard blocker requiring stakeholder input, or failing required checks.
- For active pickup checks, prefer `make go-ready ROLE="<Current Role>"` (runtime references + preflight + governance guard + deterministic tasks preview).
- Before loop execution, prefer `make go-all-ready ROLE="<Current Role>"`.
- For a deterministic top-5 backlog list, use `make tasks ROLE="<Current Role>"`.
- Prompt:

```text
tasks
```

to get a brief list of the next 5 tasks the agent would do (backlog and/or overdue proactive reviews).

## Commit Workflow
- `commit-msg` holds the commit message for a completed work unit.
- `commit.sh` runs `make preflight`, then commits all staged changes and pushes to `origin/main`.
- Install local Git hooks once per clone to enforce the same preflight gate on manual commits:

```bash
make hooks-install
```

- Commit message format follows:
  - `docs/03-engineering/commit-message-guidelines.md`

## Governance and Process
Start here:
- `AGENTS.md`
- `backlog/README.md`
- `openspec/README.md`
- `skills/README.md`
- `docs/README.md`
- `prompt.txt`

## Hybrid Execution
- Backlog drives execution order and role eligibility.
- OpenSpec packages non-trivial changes (`openspec/changes/...`).
- Repository skills reduce repeated coordination work (`skills/.../SKILL.md`).
