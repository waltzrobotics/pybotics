check-package:
	poetry check -v

check-typing:
	poetry run mypy --strict .

check-format:
	poetry run black --check .
	poetry run isort -rc -c .

lint:
	poetry run flake8 pybotics tests examples
	poetry run vulture --min-confidence 80 --sort-by-size pybotics tests examples

check: check-format check-package check-typing lint

format:
	poetry run black .
	poetry run isort -rc .

test:
	poetry run pytest

build:
	poetry build

.PHONY: static check-package check-typing lint check test check-format format