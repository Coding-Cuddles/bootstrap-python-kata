all: test

# Detect available package managers
UV := $(shell command -v uv 2> /dev/null)

SRCS := $(shell git ls-files *.py)

ifdef UV
	RUNNER := uv run
else
	RUNNER :=
endif

.PHONY: run
run:
	$(RUNNER) ./main.py

.PHONY: test
test:
	$(RUNNER) pytest test_*.py

.PHONY: format
format:
	$(RUNNER) ruff format $(SRCS)

.PHONY: format-check
format-check:
	$(RUNNER) ruff format --check $(SRCS) \
		|| (echo "Some files require formatting. Run 'make format' to fix." && exit 1)

.PHONY: clean
clean:
	git clean -Xfd

ifndef VERBOSE
.SILENT:
endif
