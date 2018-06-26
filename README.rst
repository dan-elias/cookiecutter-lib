===============================
CookieCutter for Python library
===============================

Based on `cookiecutter-pipproject <https://github.com/wdm0006/cookiecutter-pipproject>`_

Features
--------

* Sphinx Documentation (Google docstring style)
* Doc hosting on `readthedocs <https://readthedocs.org/>`_
* Continuous integration with `Travis-CI <https://travis-ci.org/>`_
* Version number updating with `bumpversion <https://pypi.org/project/bumpversion>`_
* Example module and tests
* bash scripts to:

  - initialize repo
  - run tests
  - regenerate docs
  - publish to pypi

* GPL-3 license

Creating a project
------------------

.. code-block::

    $ pip install cookiecutter
    $ cookiecutter https://github.com/dan-elias/mod-cookiecutter-pipproject.git

You will be asked about your basic info (name, project name, app name, etc.). This info will be used in your new project.

Change directory to the new project folder, then run:

.. code-block::

    $ chmod +x initialize.sh
    $ ./initialize.sh

Among other things, this generates initial documentation and opens it in the
browser.  The "contributing" page in this documentation outlines details about
adding code, tests and documentation to the project.  Briefly, other useful
scripts are:

* new_module.sh - Create module, unit test and documentation files for a new module
* run_tests.sh - run unit tests and doc tests
* update_docs.sh - regenerate the project's Documentation
* open_docs.sh - Open the project's documentation using gnome-open
* publish.sh - publish tagged versions to pypi
