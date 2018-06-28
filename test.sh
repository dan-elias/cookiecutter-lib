#!/usr/bin/env bash
set -e

this_project=cookiecutter-pylib
test_project=xx_test_prj

while [ "$(basename $(pwd))" = "$this_project" ]; do cd ..; done

if [ -d $test_project ]
then
  yes | rm -r $test_project
fi

cookiecutter --no-input $this_project
cd $test_project
./initialize.sh --test
