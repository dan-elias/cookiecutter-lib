#!/usr/bin/env bash
set -e

this_script=`basename "$0"`

for script_name in *.sh
do
  chmod +x $script_name
done

read -n1 -r -p "Manual step: Go to github and create {{ cookiecutter.app_name }} repo, then press any key to continue..." key

git init
git add .
git reset $this_script
git commit -m 'Initialization'
git remote add origin git@github.com:{{ cookiecutter.github_username }}/{{ cookiecutter.app_name }}.git
git push -u origin master

pip install -e .

rm $this_script
