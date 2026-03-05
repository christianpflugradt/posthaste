.PHONY: fmt clippy test check preflight governance-guard

fmt:
	cargo fmt --check

clippy:
	cargo clippy -- -D warnings

test:
	cargo test

check: fmt clippy test

preflight:
	./scripts/preflight.sh $(if $(ROLE),--role "$(ROLE)",)

governance-guard:
	./scripts/governance_guard.sh
