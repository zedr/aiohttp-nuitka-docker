.PHONY: deps install clean tests dist

ENV=.env
PYTHON_VERSION=3.7
PYTHON=python${PYTHON_VERSION}
SITE_PACKAGES=${ENV}/lib/${PYTHON}/site-packages
IN_ENV=. ${ENV}/bin/activate;

default: ${ENV} deps

${ENV}:
	@echo "Creating Python environment..." >&2
	@${PYTHON} -m venv ${ENV}
	@echo "Updating pip..." >&2
	@${IN_ENV} ${PYTHON} -m pip install -U pip setuptools

${SITE_PACKAGES}/aiohttp: ${ENV}
	@${IN_ENV} ${PYTHON} -m pip install -r requirements.txt

${SITE_PACKAGES}/aio-demo: ${ENV} install

deps: ${SITE_PACKAGES}/aiohttp

install: default
	@${IN_ENV} ${PYTHON} -m pip install -e .

tests: default
	@${IN_ENV} ${PYTHON} tests.py

wheel: ${ENV}
	@${IN_ENV} ${PYTHON} -m pip install -U wheel
	@${IN_ENV} ${PYTHON} setup.py bdist_wheel

binary: ${ENV}
	@${IN_ENV} ${PYTHON} -m pip install -U nuitka
	@${IN_ENV} ${PYTHON} -m nuitka --recurse-to=aiohttp main.py

dist: wheel

clean:
	@rm -rf ${ENV} dist build __pycache__ *.egg-info main.build main.dist main.exe
