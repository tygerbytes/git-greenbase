
test: clone_bats
	@echo "Running tests"
	@cd tests; ./tests.sh; cd ..
	@echo Done!
.PHONY: test

clone_bats:
	./tests/clone_bats

clean:
	@echo "Cleaning up"
	@echo "Remove bats repo"
	rm -rf tests/bats
	@echo "Remove ignored files"
	git clean -fXd
	@echo Done!

install:
	@echo "Installing"
	@./install
	@echo "Done!"
.PHONY: install

