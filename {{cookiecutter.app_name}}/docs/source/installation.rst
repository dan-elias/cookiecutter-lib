Installation
============

Method 1: pip
^^^^^^^^^^^^^

.. code-block:: bash

    $ pip install {{ cookiecutter.app_name }}

Method 2: Clone the `github repo <https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.app_name }}>`_
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: bash

    $ git clone https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.app_name }}.git

To install with editing enabled (ie: for development), use:

.. code-block:: bash

    $ cd {{ cookiecutter.app_name }}
    $ pip install -e .

Otherwise, omit the "-e" option:

.. code-block:: bash

    $ cd {{ cookiecutter.app_name }}
    $ pip install .
