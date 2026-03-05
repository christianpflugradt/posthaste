# Evaluation Framework

## Purpose
Provide repeatable quality checks for AI hashtag suggestions.

## Dataset
- Store input fixtures in `eval/fixtures/`.
- Store baseline outputs/expectations in `eval/baselines/`.

## Core Metrics
- Relevance: how well tags match post topic.
- Specificity: avoids generic-only suggestions.
- Diversity: includes both broad and niche tags.
- Format validity: output schema and hashtag formatting.

## Gate Policy
AI-affecting changes must show no unacceptable regression against baseline thresholds.

## Reporting
Each run should output metric deltas and regression flags.
