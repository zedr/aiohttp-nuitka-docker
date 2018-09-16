.PHONY: deps install clean tests dist

ENV=.env
SYS_PYTHON=$(shell which python3.7)
SYS_PYTHON_VERSION=$(shell ${SYS_PYTHON} -V | cut -d " " -f 2 | cut -c1-3)
SITE_PACKAGES=${ENV}/lib/python${SYS_PYTHON_VERSION}/site-packages
IN_ENV=. ${ENV}/bin/activate;

default: ${ENV} deps

${ENV}:
	@echo "Creating Python environment..." >&2
	@${SYS_PYTHON} -m venv ${ENV}
	@echo "Updating pip..." >&2
	@${IN_ENV} python -m pip install -U pip setuptools

${SITE_PACKAGES}/aiohttp: ${ENV}
	@${IN_ENV} python -m pip install -r requirements.txt

deps: ${SITE_PACKAGES}/aiohttp

install: default
	@${IN_ENV} python -m pip install -e .

tests: default
	@${IN_ENV} python tests.py

wheel: ${ENV}
	@${IN_ENV} python -m pip install -U wheel
	@${IN_ENV} python setup.py bdist_wheel

dist: wheel

clean:
	@rm -rf ${ENV} dist build __pycache__ *.egg-info
