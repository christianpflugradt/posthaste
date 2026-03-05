# Incident Playbook

## Trigger Examples
- Major relevance degradation in suggestions.
- Schema/format failures in production-like usage.
- Repeated provider failures without graceful fallback.

## Response Steps
1. Classify severity and scope.
2. Stabilize (rollback or disable risky path).
3. Communicate impact and workaround.
4. Root-cause analysis and corrective actions.

## Post-Incident
- Document timeline and contributing factors.
- Add regression coverage (tests/eval fixtures).
- Track action items to completion.
