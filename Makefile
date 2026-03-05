.PHONY: fmt clippy test check

fmt:
	cargo fmt --check

clippy:
	cargo clippy -- -D warnings

test:
	cargo test

check: fmt clippy test
