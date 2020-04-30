# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import java as j with context %}

java-default-package-repo-pkgrepo-absent:
  pkgrepo.absent:
    - name: {{ j.default.pkg.repo.name }}
    - onlyif: {{ j.default.pkg.repo and j.default.pkg.use_upstream_repo }}
