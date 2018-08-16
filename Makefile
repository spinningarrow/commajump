SHELL := /usr/bin/env fish

.PHONY: test

test:
	fishtape tests/tests.fish
