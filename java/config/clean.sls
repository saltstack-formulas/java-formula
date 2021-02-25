# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as j with context %}

include:
  - .linuxenv.clean

java-config-cleanup:
  file.absent:
    - names:
      - {{ j.config_file }}
      - {{ j.environ_file }}
