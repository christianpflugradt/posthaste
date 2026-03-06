# DEC-0004: Product scope reset to NLP-first with no LinkedIn API/scraping dependency

## Type
- Scope adjustment

## Related Items
- PB-0018
- PB-0019
- PB-0020
- PB-0022

## Context
Stakeholder reassessed feasibility and found no reliable evidence for an official LinkedIn hashtag popularity API endpoint suitable for this roadmap. Scraping-based popularity extraction is also considered policy/legal-risky and out of scope.

## Decision
- Remove LinkedIn API dependency from active product roadmap items.
- Explicitly prohibit scraping-based popularity collection in MVP planning.
- Introduce a hard viability gate: pure local NLP quality must beat stakeholder "30-second manual hashtaging" baseline before continuing deeper roadmap investment.
- Reprioritize open backlog to run viability evaluation before broader capability expansion.

## Tradeoffs
- Defers API-driven popularity ambitions.
- Improves compliance/scope clarity and reduces risk of building on unverified platform assumptions.

## Risks Accepted
- Popularity signal quality may be weaker short-term without external API data.
- More emphasis on curated priors and evaluation design quality.

## Effective Date
- 2026-03-06

## Approved By
- Stakeholder: @cpf
