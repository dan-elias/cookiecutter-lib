#!/usr/bin/env bash
set -e

for arg in "$@"
do
  case $arg in
      -t|--test)
        test_mode=Y
      shift
      ;;
      *)
        echo "USAGE: $0 [options]"
        echo "Options:"
        echo "    -t, --test: test mode (don't install, push to github or delete this script)"
        exit 1
      ;;
  esac
done

this_script=`basename "$0"`

for script_name in *.sh
do
  chmod +x $script_name
done

git init
git add .
git reset $this_script
git commit -m 'Initialization'
git remote add origin git@github.com:{{ cookiecutter.github_username }}/{{ cookiecutter.app_name }}.git
./run_tests.sh
./update_docs.sh

if [ "$test_mode" != "Y" ]
then
  read -n1 -r -p "Manual step: Go to github and create {{ cookiecutter.app_name }} repo, then press any key to continue..." key
  git push -u origin master
  pip install -e .
  rm $this_script
fi
