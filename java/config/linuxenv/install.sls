# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import java as j with context %}

{%- if j.linux.altpriority|int > 0 and grains.os_family not in ('Arch', 'MacOS') and j.commands %}
       {%- set sls_archive_install = tplroot ~ '.archive.install' %}

include:
  -  {{ sls_archive_install }}

       {%- for cmd in j.commands %}

java-config-alternatives-install-{{ cmd }}:
  alternatives.install:
    - unless: {{ grains.os_family in ('Suse', 'Arch') }}
    - name: link-java-{{ cmd }}
    - link: {{ j.dir.symlink }}/{{ cmd }}
    - path: {{ j.path }}/bin/{{ cmd }}
    - priority: {{ j.linux.altpriority }}
    - order: 10
    - require:
      - sls: {{ sls_archive_install }}
  cmd.run:
    - onlyif: {{ grains.os_family in ('Suse',) }}
    - name: update-alternatives --install {{ j.dir.symlink }}/{{ cmd }} link-java-{{ cmd }} {{ j.path }}/bin/{{ cmd }} {{ j.linux.altpriority }} # noqa 204

java-config-alternatives-set-{{ cmd }}:
  alternatives.set:
    - unless: {{ grains.os_family in ('Suse', 'Arch') }}
    - name: link-java-{{ cmd }}
    - path: {{ j.path }}/bin/{{ cmd }}
    - require:
      - sls: {{ sls_archive_install }}
      - alternatives: java-config-alternatives-install-{{ cmd }}

       {%- endfor %}
{%- endif %}
