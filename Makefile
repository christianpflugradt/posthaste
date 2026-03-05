.PHONY: fmt clippy test check preflight preflight-test governance-guard governance-guard-test tasks

fmt:
	cargo fmt --check

clippy:
	cargo clippy -- -D warnings

test:
	cargo test

check: fmt clippy test

preflight:
	./scripts/preflight.sh $(if $(ROLE),--role "$(ROLE)",)

preflight-test:
	./scripts/test_preflight.sh

governance-guard:
	./scripts/governance_guard.sh

governance-guard-test:
	./scripts/test_governance_guard.sh

tasks:
	./scripts/tasks.sh $(if $(ROLE),--role "$(ROLE)",) $(if $(LIMIT),--limit "$(LIMIT)",)
