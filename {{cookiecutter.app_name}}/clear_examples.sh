#!/usr/bin/env bash
set -e

rm tests/test_example.py
rm {{ cookiecutter.app_name }}/example.py
rm docs/source/code_pages/example.rst
rm $0
