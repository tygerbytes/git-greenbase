SHELL := /bin/bash

test: clone_bats
	@echo "Running tests"
	@./run_tests
	@echo Done!
.PHONY: test

clone_bats:
	@echo "Ensure bats exists"
	@./lib/clone_bats

clean:
	@echo "Cleaning up"
	@echo "Remove bats repo"
	rm -rf lib/bats
	@echo "Remove ignored files"
	git clean -fXd
	@echo Done!

install:
	@echo "Installing"
	@./install
	@echo "Done!"
.PHONY: install

