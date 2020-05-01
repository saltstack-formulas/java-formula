.. _readme:

java-formula
============

|img_travis| |img_sr|

.. |img_travis| image:: https://travis-ci.com/saltstack-formulas/java-formula.svg?branch=master
   :alt: Travis CI Build Status
   :scale: 100%
   :target: https://travis-ci.com/saltstack-formulas/java-formula
.. |img_sr| image:: https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg
   :alt: Semantic Release
   :scale: 100%
   :target: https://github.com/semantic-release/semantic-release

Formula to install Java on GNU/Linux and MacOS, supporting multiple JDK/JRE providers (default is AdoptOpenJK):

- AdoptOpenJDK <https://adoptopenjdk.net>
- Amazon Corretto <https://aws.amazon.com/corretto>
- Graalvm <https://www.graalvm.org>
- Haikuvm <http://haiku-vm.sourceforge.net>
- IntelliJ <https://bintray.com/jetbrains/intellij-jdk>
- Oracle  <https://www.oracle.com/java>
- Zulu <https://www.azul.com>


Set `java.provider = <adopt|amazon|graalvm|haikuvm|intellij|oracle|zulu>` to choose.

.. contents:: **Table of Contents**

General notes
-------------

See the full `SaltStack Formulas installation and usage instructions
<https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

If you are interested in writing or contributing to formulas, please pay attention to the `Writing Formula Section
<https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html#writing-formulas>`_.

If you want to use this formula, please pay attention to the ``FORMULA`` file and/or ``git tag``,
which contains the currently released version. This formula is versioned according to `Semantic Versioning <http://semver.org/>`_.

See `Formula Versioning Section <https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html#versioning>`_ for more details.

If you need (non-default) configuration, please pay attention to the ``pillar.example`` file and/or `Special notes`_ section.

Contributing to this repo
-------------------------

**Commit message formatting is significant!!**

Please see `How to contribute <https://github.com/saltstack-formulas/.github/blob/master/CONTRIBUTING.rst>`_ for more details.

Special notes
-------------

None.


Available states
----------------

.. contents::
   :local:

``java``
^^^^^^^^^^

*Meta-state (This is a state that includes other states)*.

This installs Java package,
manages Java configuration file and then
configures the development environment.

``java.archive``
^^^^^^^^^^^^^^^^^

This state will install Java from archive only.

``java.macapp``
^^^^^^^^^^^^^^^^^

This state will install Java macpackage on MacOS only, if supplied by provider.

``java.package``
^^^^^^^^^^^^^^^^^

This state installs default Java package supplied by OS if applicable (not recommended).

``java.config``
^^^^^^^^^^^^^^^^^

This state will configure java and/or environment and has a dependency on ``java.install``
via include list.

``java.config.linuxenv``
^^^^^^^^^^^^^^^^^^^^

This state will setup Java linux-alternatives on GNU/Linux.

``java.clean``
^^^^^^^^^^^^^^^^

*Meta-state (This is a state that includes other states)*.

this state will undo everything performed in the ``java`` meta-state in reverse order, i.e.
removes the configuration file and
then uninstalls the package.

``java.config.clean``
^^^^^^^^^^^^^^^^^^^^^^^

This state will remove the configuration of Java and has a
dependency on ``java.package.clean`` via include list.

``java.archive.clean``
^^^^^^^^^^^^^^^^^^^^^^^^

This state will remove Java package and has a dependency on
``java.config.clean`` via include list.

``java.macapp.clean``
^^^^^^^^^^^^^^^^^^^^^^^^

This state will remove Java mapackage and has a dependency on
``java.config.clean`` via include list.

``java.macapp.clean``
^^^^^^^^^^^^^^^^^^^^^^^^

This state removes Java using OS package manager and depends on
``java.config.clean`` via include list.

``java.config.linuxenv.clean``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This state will remove Java linux-alternatives on GNU/Linux.


Testing
-------

Linux testing is done with ``kitchen-salt``.

Requirements
^^^^^^^^^^^^

* Ruby
* Docker

.. code-block:: bash

   $ gem install bundler
   $ bundle install
   $ bin/kitchen test [platform]

Where ``[platform]`` is the platform name defined in ``kitchen.yml``,
e.g. ``debian-9-2019-2-py3``.

``bin/kitchen converge``
^^^^^^^^^^^^^^^^^^^^^^^^

Creates the docker instance and runs the ``java`` main state, ready for testing.

``bin/kitchen verify``
^^^^^^^^^^^^^^^^^^^^^^

Runs the ``inspec`` tests on the actual instance.

``bin/kitchen destroy``
^^^^^^^^^^^^^^^^^^^^^^^

Removes the docker instance.

``bin/kitchen test``
^^^^^^^^^^^^^^^^^^^^

Runs all of the stages above in one go: i.e. ``destroy`` + ``converge`` + ``verify`` + ``destroy``.

``bin/kitchen login``
^^^^^^^^^^^^^^^^^^^^^

Gives you SSH access to the instance for manual testing.

