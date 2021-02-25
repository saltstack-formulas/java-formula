# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as j with context %}
{%- set provider = j.provider|string %}

    {%- if grains.kernel|lower in ('linux', 'darwin') %}
           {%- set sls_archive_install = tplroot ~ '.archive' %}
           {%- set sls_macapp_install = tplroot ~ '.macapp' %}
           {%- set sls_package_install = tplroot ~ '.package' %}

include:
       {%- if j[j.provider]['pkg']['use_upstream_archive'] %}
  - {{ sls_archive_install }}
       {%- elif j[j.provider]['pkg']['use_upstream_macapp'] %}
  - {{ sls_macapp_install }}
       {%- else %}
  - {{ sls_package_install }}
       {%- endif %}
  - .config

    {%- else %}

java-not-available-to-install:
  test.show_notification:
    - text: |
        The java formula is unavailable/untested on {{ salt['grains.get']('finger', grains.os_family) }}

    {%- endif %}
