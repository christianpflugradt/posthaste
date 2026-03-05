# ADR-002: GitHub as Platform of Record

## Status
Accepted

## Context
The project is a single GitHub repository and requires automation for CI/CD, releases, artifact publication, and open-source collaboration.

The stakeholder set GitHub as a fixed architectural decision.

## Decision
Use GitHub as the system of record for:
- source repository and collaboration workflow,
- CI automation via GitHub Actions,
- release tagging and artifact publication,
- repository-hosted project workflows.

## Consequences
- Positive:
  - integrated workflows for CI, release, and artifact distribution.
  - low operational overhead for a small team and open-source setup.
  - strong ecosystem and community familiarity.
- Negative:
  - platform coupling to GitHub workflows.
  - migration cost if platform changes in the future.
- Neutral:
  - architecture and scripts should remain reasonably portable where practical.

## Alternatives Considered
- Multi-platform or self-hosted CI/CD from start: rejected due to complexity and no-budget tooling policy.

## Revisit Triggers
This ADR is fixed by stakeholder decision and not currently open for revision.

## Links
- RFC: TBD
- Related backlog items: PB-0001, PB-0002
- Related PRs/commits: TBD
