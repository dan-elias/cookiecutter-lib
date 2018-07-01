#!/usr/bin/env bash
set -e

this_script=`basename "$0"`
requirements_build=requirements_build.txt
requirements_doc=requirements_doc.txt

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

for script_name in *.sh
do
  chmod +x $script_name
done

git init
git add .
git reset $this_script
git commit -m 'Initialization'
git remote add origin git@github.com:{{ cookiecutter.github_username }}/{{ cookiecutter.app_name }}.git
if [ "$test_mode" != "Y" ]
then
  pip install -r $requirements_build
  pip install -r $requirements_doc
fi
./run_tests.sh
./update_docs.sh

if [ "$test_mode" != "Y" ]
then
  read -n1 -r -p "Manual step: Go to github and create {{ cookiecutter.app_name }} repo, then press any key to continue ..." key
  git push -u origin master
  pip install -e .
  rm $this_script
  echo "Manual steps:"
  echo "  * Go to https://readthedocs.org/dashboard/ and import {{ cookiecutter.app_name }}"
  echo "  * Go to https://travis-ci.org/profile/{{ cookiecutter.github_username }}, Sync the account and enable tests for {{ cookiecutter.app_name }}"
  echo "  * Make these changes on https://readthedocs.org/dashboard/{{ cookiecutter.app_name }}/advanced/ :"
  echo "    - check 'Install Project'"
  echo "    - in the 'Requirements file' box, type: requirements_rtd.txt"
  echo "    - set the Python interpreter to CPython3.x"
fi
