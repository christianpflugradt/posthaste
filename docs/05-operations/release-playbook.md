# Release Playbook

## Ownership
- Product Owner owns release timing decisions.
- Stakeholder provides go/no-go approval.
- Reviewing Developer provides release recommendation based on review disposition.

## Preconditions
- Tests pass.
- Evaluation gates pass.
- Reviewer sign-off complete.
- Changelog/release notes updated.
- Working snapshot artifact exists to prove baseline operability.

## Release Steps
1. Confirm version and scope.
2. Publish artifact/release tag.
3. Announce changes and known limitations.

## Snapshot Policy
- A verifiable working snapshot must exist continuously, even when a full release is not created.
- Snapshot artifacts should be reproducible from CI and traceable to commit SHA.
- Product Owner decides when a snapshot is promoted to a formal release.

## Rollback
- Define rollback trigger conditions.
- Revert to last known good release.
- Record incident and corrective actions.

## Post-Release
- Monitor for quality regressions.
- Capture follow-up actions in backlog.
