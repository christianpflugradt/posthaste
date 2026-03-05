# System Overview

## Context
`posthaste` is a CLI-first application with an AI inference core and strict output validation.

## Components
- CLI interface (input handling and output formatting).
- Hashtag suggestion service (model calls + prompt strategy).
- Schema validation layer (structured output parsing).
- Evaluation runner (fixture-based quality checks).

## Data Flow
1. User provides raw post text.
2. Service builds constrained prompt and requests structured output.
3. Output is validated and normalized.
4. Ranked suggestions are returned to CLI.

## Failure Modes
- Provider/model unavailable.
- Invalid model output schema.
- Low-confidence or irrelevant suggestions.
