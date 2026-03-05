.PHONY: fmt clippy test check preflight preflight-test governance-guard governance-guard-test tasks tasks-test index-sync go-ready go-all-ready

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

tasks-test:
	./scripts/test_tasks.sh

index-sync:
	./scripts/index_sync.sh

go-ready:
	./scripts/go_ready.sh

go-all-ready:
	./scripts/go_all_ready.sh
