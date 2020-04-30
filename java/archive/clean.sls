# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import java as j with context %}

include:
  - .jce.clean

java-package-archive-clean-file-absent:
  file.absent:
    - names:
      - {{ j.path }}
      - {{ j.dir.tmp }}/java-archive.tar.gz
    {%- if j.linux.altpriority|int == 0 or grains.os_family in ('Arch', 'MacOS') and j.commands %}
           {%- for cmd in j.commands %}
      - {{ j.dir.symlink }}/{{ cmd }}
           {%- endfor %}
    {%- endif %}
