#!/usr/bin/env bash
set -e

python setup.py sdist #bdist_wheel
twine upload -r {{ cookiecutter.pypi_index_server }} dist/*