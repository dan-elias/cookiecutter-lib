#!/usr/bin/env bash
set -e

pytest --doctest-modules --cov={{cookiecutter.app_name}}
