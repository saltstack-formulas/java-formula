# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import java as j with context %}

java-package-macapp-clean-file-absent:
  file.absent:
    - names:
      - {{ j.path }}/*/{{ j.pkg.name }}
      - {{ j.dir.tmp }}
           {%- if grains.os_family in ('MacOS') and j.commands %}
                  {%- for cmd in j.commands %}
      - {{ j.dir.symlink }}/{{ cmd }}
                  {%- endfor %}
           {%- endif %}
