#!/usr/bin/env bash
set -e

function show_usage {
  echo "USAGE: $0 [options]"
  echo "Options:"
  echo "    -h, --help: show this message and exit"
  echo "    -t, --test: test mode (don't install, push to github or delete this script)"
  }

for arg in "$@"
do
  case $arg in
      -t|--test)
        test_mode=Y
      ;;
      -h|--help)
        show_usage
        exit 0
      ;;
      *)
        show_usage
        exit 1
      ;;
  esac
done

this_script=`basename "$0"`

for script_name in *.sh
do
  chmod +x $script_name
done

build_requirements=build_requirements.txt

git init
git add .
git reset $this_script
git commit -m 'Initialization'
git remote add origin git@github.com:{{ cookiecutter.github_username }}/{{ cookiecutter.app_name }}.git
pip install -r $build_requirements
./run_tests.sh
./update_docs.sh

if [ "$test_mode" != "Y" ]
then
  read -n1 -r -p "Manual step: Go to github and create {{ cookiecutter.app_name }} repo, then press any key to continue ..." key
  git push -u origin master
  pip install -e .
  rm $this_script
  rm $build_requirements
  echo "Manual steps:"
  echo "  * Go to https://readthedocs.org/dashboard/ and import "
fi
