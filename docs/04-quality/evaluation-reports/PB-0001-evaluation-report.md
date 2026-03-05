# Evaluation Report: PB-0001

## Change Summary
PB-0001 introduces offline hashtag suggestion behavior and ranking logic in the runtime path (`src/lib.rs`, `src/main.rs`), so AI-affecting quality gates apply.

## Dataset/Baseline
- Fixture set: Not available (`eval/fixtures/` has no PB-0001 fixture corpus).
- Baseline version: Not available (`eval/baselines/` has no PB-0001 baseline outputs/thresholds).

## Metric Results
- Relevance: Not executed (missing fixture/baseline inputs).
- Specificity: Not executed (missing fixture/baseline inputs).
- Diversity: Not executed (missing fixture/baseline inputs).
- Format validity: Not executed (missing fixture/baseline inputs).

## Regressions Detected
Cannot determine regressions because no baseline evaluation run was possible.

## Decision
- [ ] Pass
- [ ] Pass with accepted tradeoff
- [x] Fail

## Notes
- Non-AI gates were independently verified and passed: `cargo fmt --check`, `cargo clippy -- -D warnings`, `cargo test`.
- This report blocks QE gate completion until fixture-based baseline evaluation evidence is produced (or stakeholder explicitly accepts risk).
