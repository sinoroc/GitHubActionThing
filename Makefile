#


source_dir := ./src
tests_dir := ./test


.DEFAULT_GOAL := refresh


.PHONY: refresh
refresh: clean develop review package


.PHONY: develop
develop:
	python -m pip install --editable .


.PHONY: package
package: check sdist wheel


.PHONY: sdist
sdist:
	python -m build --sdist
	python -m twine check dist/*.tar.gz


.PHONY: wheel
wheel:
	python -m build --wheel
	python -m twine check dist/*.whl


.PHONY: format
format:
	python -m yapf --in-place --parallel --recursive setup.py $(source_dir) $(tests_dir)


.PHONY: check
check:
	python setup.py check


.PHONY: lint
lint:
	python -m pytest --mypy --pycodestyle --pydocstyle --pylint -m 'mypy or pycodestyle or pydocstyle or pylint'


.PHONY: mypy
mypy:
	python -m pytest --mypy -m mypy


.PHONY: pycodestyle
pycodestyle:
	python -m pytest --pycodestyle -m pycodestyle


.PHONY: pydocstyle
pydocstyle:
	python -m pytest --pydocstyle -m pydocstyle


.PHONY: pylint
pylint:
	python -m pytest --pylint -m pylint


.PHONY: yapf
yapf:
	python -m pytest --yapf -m yapf


.PHONY: test
test: pytest


.PHONY: pytest
pytest:
	python -m pytest


.PHONY: review
review: check
	python -m pytest --mypy --pycodestyle --pydocstyle --pylint


.PHONY: clean
clean:
	$(RM) --recursive ./.eggs/
	$(RM) --recursive ./.mypy_cache/
	$(RM) --recursive ./.pytest_cache/
	$(RM) --recursive ./build/
	$(RM) --recursive ./dist/
	$(RM) --recursive ./__pycache__/
	find $(source_dir) -name '*.dist-info' -type d -exec $(RM) --recursive {} +
	find $(source_dir) -name '*.egg-info' -type d -exec $(RM) --recursive {} +
	find $(source_dir) -name '*.pyc' -type f -exec $(RM) {} +
	find $(tests_dir) -name '*.pyc' -type f -exec $(RM) {} +
	find $(source_dir) -name '__pycache__' -type d -exec $(RM) --recursive {} +
	find $(tests_dir) -name '__pycache__' -type d -exec $(RM) --recursive {} +


#
# Options
#

# Disable default rules and suffixes (improve speed and avoid unexpected behaviour)
MAKEFLAGS := --no-builtin-rules --warn-undefined-variables
.SUFFIXES:


# EOF
