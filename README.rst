=================================
Modified CookieCutter Pip-Project
=================================

Based on `cookiecutter-pipproject <https://github.com/wdm0006/cookiecutter-pipproject>`_

Features
--------

* Sphinx Documentation (Google docstring style)
* Continuous integration with Travis-CI
* Example module and tests
* GPL-3 license
* scripts to initialize git, run tests, regenerate docs, open docs

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
