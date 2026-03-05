# AI Design

## Objectives
- Generate relevant LinkedIn hashtags.
- Keep output deterministic enough for regression testing.
- Ensure parseable structured output.

## Design Rules
- Use provider abstraction to avoid lock-in.
- Enforce JSON schema for model responses.
- Apply normalization and deduplication post-processing.
- Keep temperature low for stability in tests.

## Output Contract (Draft)
- `hashtag`: string
- `confidence`: number (0-1)
- `rationale`: short string

## Safety
- Avoid spammy or misleading tags.
- Avoid irrelevant opportunistic tags.
