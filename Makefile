SHELL := /bin/bash

.PHONY: docs clean-docs

docs:
	bash scripts/build-docs.sh

clean-docs:
	rm -rf docs/proposal/build docs/report/build
