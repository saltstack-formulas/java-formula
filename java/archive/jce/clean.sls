# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import java as j with context %}

java-jce-package-archive-clean-file-absent:
  file.absent:
    - names:
      - {{ j.dir.security }}/US_export_policy.jar.*
      - {{ j.dir.security }}/local_export_policy.jar.*
      - {{ j.dir.tmp }}/unlimited.zip
