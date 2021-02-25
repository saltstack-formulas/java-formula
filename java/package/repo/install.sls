# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as j with context %}
{%- from tplroot ~ "/files/macros.jinja" import format_kwargs with context %}

java-default-package-repo-pkgrepo-managed:
  pkgrepo.managed:
    {{- format_kwargs(j.default.pkg.repo) }}
    - onlyif: {{ j.default.pkg.repo and j.default.pkg.use_upstream_repo }}
