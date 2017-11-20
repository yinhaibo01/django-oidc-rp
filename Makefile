.PHONY: install qa lint tests spec coverage


# DEVELOPMENT
# ~~~~~~~~~~~
# The following rules can be used during development in order to compile staticfiles, generate
# locales, build documentation, etc.
# --------------------------------------------------------------------------------------------------

# Installs all the project's dependencies.
install:
	pipenv install --dev


# QUALITY ASSURANCE
# ~~~~~~~~~~~~~~~~~
# The following rules can be used to check code quality, import sorting, etc.
# --------------------------------------------------------------------------------------------------

qa: lint isort

# Code quality checks (eg. flake8, eslint, etc).
lint:
	pipenv run flake8

# Import sort checks.
isort:
	pipenv run isort --check-only --recursive --diff oidc_rp tests


# TESTING
# ~~~~~~~
# The following rules can be used to trigger tests execution and produce coverage reports.
# --------------------------------------------------------------------------------------------------

# Just runs all the tests!
tests:
	pipenv run py.test

# Collects code coverage data.
coverage:
	pipenv run py.test --cov-report term-missing --cov oidc_rp

# Run the tests in "spec" mode.
spec:
	pipenv run py.test --spec -p no:sugar
