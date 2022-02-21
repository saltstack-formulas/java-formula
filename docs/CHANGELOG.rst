
Changelog
=========

`2.0.1 <https://github.com/saltstack-formulas/java-formula/compare/v2.0.0...v2.0.1>`_ (2022-02-21)
------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **libmapstack:** allow mapping by booleans and numbers (\ `aea3488 <https://github.com/saltstack-formulas/java-formula/commit/aea3488b2e3f50f4088d4e718eae745b77153cee>`_\ )
* **libsaltcli+libmatchers:** ensure Salt client API detection [skip ci] (\ `e5f372e <https://github.com/saltstack-formulas/java-formula/commit/e5f372e17e67222d2c65eaef1fd6896121825fb0>`_\ )

Code Refactoring
^^^^^^^^^^^^^^^^


* **map.jinja:** standardise v5 structure [skip ci] (\ `3c25663 <https://github.com/saltstack-formulas/java-formula/commit/3c256632db950895d8850a221c1ea88fd8813669>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* update linters to latest versions [skip ci] (\ `f5dd172 <https://github.com/saltstack-formulas/java-formula/commit/f5dd172a3ae6dc0acc80de8eb896c301b4d7c2f3>`_\ )
* **3003.1:** update inc. AlmaLinux, Rocky & ``rst-lint`` [skip ci] (\ `6eec660 <https://github.com/saltstack-formulas/java-formula/commit/6eec660a9339171f8b4d389a04fdde3734fa1e6c>`_\ )
* **gemfile:** allow rubygems proxy to be provided as an env var [skip ci] (\ `3d58f08 <https://github.com/saltstack-formulas/java-formula/commit/3d58f086b4dd11b4263eb54a37192edd9a998671>`_\ )
* **gemfile+lock:** use ``ssf`` customised ``inspec`` repo [skip ci] (\ `b498844 <https://github.com/saltstack-formulas/java-formula/commit/b4988449e526e5a40b9351ef2645334b4a9f2c37>`_\ )
* **intellij:** disable failing suite (missing bintray download) [skip ci] (\ `30c1267 <https://github.com/saltstack-formulas/java-formula/commit/30c126753b50bfe0716cf87879d1c471ee0cd2e5>`_\ )
* **kitchen:** move ``provisioner`` block & update ``run_command`` [skip ci] (\ `8a93926 <https://github.com/saltstack-formulas/java-formula/commit/8a93926b99d8c74b6ba199f662dc353c98ed93cd>`_\ )
* **kitchen+ci:** update with ``3004`` pre-salted images/boxes [skip ci] (\ `6b931bd <https://github.com/saltstack-formulas/java-formula/commit/6b931bd64e6049fe78d84eec43688f99e31a4270>`_\ )
* **kitchen+ci:** update with latest ``3003.2`` pre-salted images [skip ci] (\ `55f2176 <https://github.com/saltstack-formulas/java-formula/commit/55f2176c42ba5cd4c0b0756f5710cc8aac095390>`_\ )
* **kitchen+ci:** update with latest CVE pre-salted images [skip ci] (\ `4b82aef <https://github.com/saltstack-formulas/java-formula/commit/4b82aef3d7e276dcbd5e9ee33d699f4d2057024d>`_\ )
* **kitchen+ci:** use latest pre-salted images (after CVE) [skip ci] (\ `e5e0b49 <https://github.com/saltstack-formulas/java-formula/commit/e5e0b493d8f0d75b5dca2a24dbb29b7c256c698e>`_\ )
* **kitchen+gitlab:** update for new pre-salted images [skip ci] (\ `4f70af9 <https://github.com/saltstack-formulas/java-formula/commit/4f70af9bb0167e8dba7cc64e3c3d08f759b2f441>`_\ )
* add Debian 11 Bullseye & update ``yamllint`` configuration [skip ci] (\ `b78bb54 <https://github.com/saltstack-formulas/java-formula/commit/b78bb54611d9cc3fdde5d07c4f883de2ae55a338>`_\ )
* **kitchen+gitlab:** remove Ubuntu 16.04 & Fedora 32 (EOL) [skip ci] (\ `b10f529 <https://github.com/saltstack-formulas/java-formula/commit/b10f529cb57c51c1e08e8e5410b5568528b7e7f2>`_\ )
* add ``arch-master`` to matrix and update ``.travis.yml`` [skip ci] (\ `fc9c052 <https://github.com/saltstack-formulas/java-formula/commit/fc9c052bd47a3efdba7893e42ff0c294e0836ed1>`_\ )
* **kitchen+gitlab:** adjust matrix to add ``3003`` [skip ci] (\ `69c7574 <https://github.com/saltstack-formulas/java-formula/commit/69c7574fdde775245e7f8ace43ad5b1110398b00>`_\ )

Documentation
^^^^^^^^^^^^^


* **map.jinja:** fix ``rst-lint`` violation [skip ci] (\ `f5f76c5 <https://github.com/saltstack-formulas/java-formula/commit/f5f76c5b4f202334cca9477460913cdc8ac74c30>`_\ )
* **readme:** fix ``coala`` violations [skip ci] (\ `01878f9 <https://github.com/saltstack-formulas/java-formula/commit/01878f9340813408ec9d6d4dabda83cf356eed5f>`_\ )

Styles
^^^^^^


* **libsaltcli:** fix comments to jinja comments [skip ci] (\ `6c66b5a <https://github.com/saltstack-formulas/java-formula/commit/6c66b5a7b318c4fb87a88a812d7423bc9e8aaf33>`_\ )

Tests
^^^^^


* **system:** add ``build_platform_codename`` [skip ci] (\ `e278c8b <https://github.com/saltstack-formulas/java-formula/commit/e278c8b9038714b30a2880ed8246a5debb8bb550>`_\ )
* standardise use of ``share`` suite & ``_mapdata`` state [skip ci] (\ `0a75e77 <https://github.com/saltstack-formulas/java-formula/commit/0a75e77a13bcdf4d492011864f9f32a5faf70d26>`_\ )

`2.0.0 <https://github.com/saltstack-formulas/java-formula/compare/v1.0.4...v2.0.0>`_ (2021-02-25)
------------------------------------------------------------------------------------------------------

Features
^^^^^^^^


* **map:** update to v5 ``map.jinja`` (\ `3b8795e <https://github.com/saltstack-formulas/java-formula/commit/3b8795ef2bb5f76183d415ed6ce82a8b1ab46a48>`_\ )

Tests
^^^^^


* **inspec:** ``map.jinja`` configuration is now in reference files (\ `80a3f8f <https://github.com/saltstack-formulas/java-formula/commit/80a3f8f30e3dea5d4473fa5ca5a30b72fe4e2ffe>`_\ )

BREAKING CHANGES
^^^^^^^^^^^^^^^^


* **map:** ``map.jinja`` now export a generic ``mapdata`` variable
* **map:** The parameters per grains are now under ``java/parameters/``

`1.0.4 <https://github.com/saltstack-formulas/java-formula/compare/v1.0.3...v1.0.4>`_ (2021-02-24)
------------------------------------------------------------------------------------------------------

Tests
^^^^^


* **inspec:** update ``map.jinja`` reference files for ``adopt`` (\ `eae10cf <https://github.com/saltstack-formulas/java-formula/commit/eae10cffcdb0a7d3e6869002d5bbf329e20dde5d>`_\ )
* **inspec:** update ``map.jinja`` reference files for ``amazon`` (\ `12f1e97 <https://github.com/saltstack-formulas/java-formula/commit/12f1e97bf1c8d548dcb369bd206d214ca09608f5>`_\ )
* **inspec:** update ``map.jinja`` reference files for ``graalvm`` (\ `bae51e6 <https://github.com/saltstack-formulas/java-formula/commit/bae51e699a23435f3a1017ce530cfde5bc174a58>`_\ )
* **inspec:** update ``map.jinja`` reference files for ``intellij`` (\ `c9a7503 <https://github.com/saltstack-formulas/java-formula/commit/c9a750361ef598a4a5e9087d10d21681cd3b8db2>`_\ )
* **inspec:** update ``map.jinja`` reference files for ``oracle`` (\ `d614e56 <https://github.com/saltstack-formulas/java-formula/commit/d614e56340574a268e6646d1741e2d6190b5bab9>`_\ )
* **inspec:** update ``map.jinja`` reference files for ``zulu`` (\ `230dbaf <https://github.com/saltstack-formulas/java-formula/commit/230dbaf6b9d95092728de11bc0ea79d6117cfce0>`_\ )

`1.0.3 <https://github.com/saltstack-formulas/java-formula/compare/v1.0.2...v1.0.3>`_ (2021-02-23)
------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **inspec:** ``mapdata`` reference files can use all YAML features (\ `f9ca0e2 <https://github.com/saltstack-formulas/java-formula/commit/f9ca0e2c245c61cd9c4e532efc91745f34e5337f>`_\ ), closes `/github.com/ruby/psych/blob/d4861854/lib/psych.rb#L317 <https://github.com//github.com/ruby/psych/blob/d4861854/lib/psych.rb/issues/L317>`_ `/github.com/inspec/inspec/blob/a5309ea/lib/inspec/resources/yaml.rb#L29 <https://github.com//github.com/inspec/inspec/blob/a5309ea/lib/inspec/resources/yaml.rb/issues/L29>`_

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **commitlint:** ensure ``upstream/master`` uses main repo URL [skip ci] (\ `8ccf1ca <https://github.com/saltstack-formulas/java-formula/commit/8ccf1ca8f4f0aeff8da2a188b1f344dbfe1a0e24>`_\ )
* **gemfile+lock:** use ``ssf`` customised ``kitchen-docker`` repo [skip ci] (\ `eff3fc0 <https://github.com/saltstack-formulas/java-formula/commit/eff3fc0612cb11e7267661a3c4c1975c70c38681>`_\ )
* **gitlab-ci:** add ``rubocop`` linter (with ``allow_failure``\ ) [skip ci] (\ `c8b0429 <https://github.com/saltstack-formulas/java-formula/commit/c8b042952214fdf2ad3dc08c741deb216594d775>`_\ )
* **gitlab-ci:** fix commented out ``lint`` section (\ `ebd1a6a <https://github.com/saltstack-formulas/java-formula/commit/ebd1a6a3a32561b41520d5d11acf30cc14127f91>`_\ )
* **gitlab-ci:** use GitLab CI as Travis CI replacement (\ `b22ced5 <https://github.com/saltstack-formulas/java-formula/commit/b22ced5b4174b4224b992aab7486ff3081769738>`_\ )
* **kitchen+gitlab-ci:** reintroduce all platforms [skip ci] (\ `2ca0ca4 <https://github.com/saltstack-formulas/java-formula/commit/2ca0ca4e9dcc89d5f449208700839079ff72b5af>`_\ )
* **kitchen+gitlab-ci:** use latest pre-salted images [skip ci] (\ `1c9a870 <https://github.com/saltstack-formulas/java-formula/commit/1c9a870e9f44bfb22e96b7adf2ab5c74b1973150>`_\ )
* **pre-commit:** add to formula [skip ci] (\ `8592ca9 <https://github.com/saltstack-formulas/java-formula/commit/8592ca9c838e6c038529a7f2f4abd96878d1b34f>`_\ )
* **pre-commit:** enable/disable ``rstcheck`` as relevant [skip ci] (\ `76ecee5 <https://github.com/saltstack-formulas/java-formula/commit/76ecee5e1e84f3d2f5f990df50bd8366e3168863>`_\ )
* **pre-commit:** finalise ``rstcheck`` configuration [skip ci] (\ `701904a <https://github.com/saltstack-formulas/java-formula/commit/701904ac47b9b04e91092c878b2df74455201256>`_\ )
* **pre-commit:** update hook for ``rubocop`` [skip ci] (\ `e97c854 <https://github.com/saltstack-formulas/java-formula/commit/e97c8542db61c522d551bcf7ae330312764c3e42>`_\ )

Tests
^^^^^


* **map:** dump ``mapdata`` content (\ `3f5ff5c <https://github.com/saltstack-formulas/java-formula/commit/3f5ff5c5134430d3d3ab5bd8ae402a4c5fa372ec>`_\ )
* **map:** verify ``mapdata`` dump against reference files (\ `ce6dc5a <https://github.com/saltstack-formulas/java-formula/commit/ce6dc5a7b2997b6ef6192062e32d798075f0c010>`_\ )

`1.0.2 <https://github.com/saltstack-formulas/java-formula/compare/v1.0.1...v1.0.2>`_ (2020-07-27)
------------------------------------------------------------------------------------------------------

Documentation
^^^^^^^^^^^^^


* **example:** use correct version in comment (\ `e1f2de8 <https://github.com/saltstack-formulas/java-formula/commit/e1f2de84ef6233dd08f0df3f8e4feccf5db56524>`_\ )

`1.0.1 <https://github.com/saltstack-formulas/java-formula/compare/v1.0.0...v1.0.1>`_ (2020-07-24)
------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **bandwidth:** only download if not installed (\ `3c2d6e4 <https://github.com/saltstack-formulas/java-formula/commit/3c2d6e4c6ecec6571c8088d3c0161920eea7fc31>`_\ )

Styles
^^^^^^


* **libtofs.jinja:** use Black-inspired Jinja formatting [skip ci] (\ `5267d7d <https://github.com/saltstack-formulas/java-formula/commit/5267d7d578c3344406f3060bcc435f99b65ada0d>`_\ )

`1.0.0 <https://github.com/saltstack-formulas/java-formula/compare/v0.1.0...v1.0.0>`_ (2020-06-16)
------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **macos:** fix macos issues (\ `8b5a56f <https://github.com/saltstack-formulas/java-formula/commit/8b5a56f1574ad8a44d64e28edb1b93e2fa42297d>`_\ )
* **macos:** troubleshooting (\ `630a159 <https://github.com/saltstack-formulas/java-formula/commit/630a15964110bdf657be878435689699130ac648>`_\ )
* **travis:** update kitchen platforms (\ `b3d239e <https://github.com/saltstack-formulas/java-formula/commit/b3d239e5908eabb0ad071ad294f95af2b4754ca3>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **travis:** update travis tests (\ `efb913f <https://github.com/saltstack-formulas/java-formula/commit/efb913fc25bd41096b8c5e2c6754945a275d0096>`_\ )

Documentation
^^^^^^^^^^^^^


* **readme:** set depth to one (\ `5a2eb8e <https://github.com/saltstack-formulas/java-formula/commit/5a2eb8e71345c29f2ff9b8eb18db4d8bfbbac61b>`_\ )
* **readme:** update readme and oracle uri (\ `d0c1af8 <https://github.com/saltstack-formulas/java-formula/commit/d0c1af8a2a786badbc43d54c5dc0590d83f388f7>`_\ )

Features
^^^^^^^^


* **formula:** rewrite, align to template formula (\ `050f0a0 <https://github.com/saltstack-formulas/java-formula/commit/050f0a0074ecd17f370631d70c0c8a7556b1f0fb>`_\ )
* **semantic-release:** standardise for this formula (\ `22020d6 <https://github.com/saltstack-formulas/java-formula/commit/22020d6b522a1507085320a049a65f69e36a7650>`_\ )

BREAKING CHANGES
^^^^^^^^^^^^^^^^


* **formula:** Major refactor of formula to bring it in alignment with the
  template-formula. As with all substantial changes, please ensure your
  existing configurations work in the ways you expect from this formula.
