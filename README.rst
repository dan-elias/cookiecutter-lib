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
