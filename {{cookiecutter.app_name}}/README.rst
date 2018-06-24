===============================
{{ cookiecutter.project_name }}
===============================

version number: {{ cookiecutter.version }}
author: {{ cookiecutter.full_name }}

Overview
--------

{{ cookiecutter.project_short_description }}

.. image:: https://readthedocs.org/projects/{{ cookiecutter.app_name }}/badge/?version=latest
    :target: https://{{ cookiecutter.app_name }}.readthedocs.io/en/latest/?badge=latest
    :alt: Documentation status unknown

.. image:: https://travis-ci.org/{{ cookiecutter.github_username }}/{{ cookiecutter.app_name }}.svg?branch=master
    :target: https://travis-ci.org/{{ cookiecutter.github_username }}/{{ cookiecutter.app_name }}
    :alt: Build status unknown

Documentation
-------------

Available at `Read the Docs <https://{{ cookiecutter.app_name }}.readthedocs.io/en/latest/>`_

Installation / Usage
--------------------

..
  Omitted instructions for installing with pip

To install, clone the repo:

.. code-block:: bash

    $ git clone https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.app_name }}.git
    $ cd {{ cookiecutter.app_name }}
    $ pip install .

To allow editing, use:

.. code-block:: bash

    $ pip install -e .

Contributing
------------

TBD

Example
-------

TBD
