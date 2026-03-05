.PHONY: fmt clippy test check preflight preflight-test governance-guard governance-guard-test

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
