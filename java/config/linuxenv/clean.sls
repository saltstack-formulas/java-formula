# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as j with context %}

{%- if j.linux.altpriority|int > 0 and grains.os_family not in ('Arch', 'MacOS') and j.commands %}
       {%- set sls_archive_clean = tplroot ~ '.archive.clean' %}

include:
  -  {{ sls_archive_clean }}

       {%- for cmd in j.commands %}

java-config-alternatives-clean-{{ cmd }}:
  alternatives.remove:
    - unless: {{ grains.os_family in ('Arch',) }}
    - name: link-java-{{ cmd }}
    - path: {{ j.path }}/bin/{{ cmd }}
    - require:
      - sls: {{ sls_archive_clean }}
    - onlyif: update-alternatives --get-selections |grep 'link-java-{{ cmd }} '

       {%- endfor %}
{%- endif %}
