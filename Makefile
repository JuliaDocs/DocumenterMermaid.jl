JULIA:=julia

default: help

docs-instantiate:
	${JULIA} --project=docs -e 'using Pkg; Pkg.instantiate()'

docs: docs-instantiate
	${JULIA} --project=docs docs/make.jl

changelog:
	${JULIA} --project=docs docs/changelog.jl

test:
	${JULIA} --project -e 'using Pkg; Pkg.test()'

help:
	@echo "The following make commands are available:"
	@echo " - make changelog: update all links in CHANGELOG.md's footer"
	@echo " - make docs: build the documentation"
	@echo " - make test: run the tests"

.PHONY: default docs-instantiate help changelog docs test
