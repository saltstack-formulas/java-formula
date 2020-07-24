
Changelog
=========

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
