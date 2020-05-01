# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import java as j with context %}
{%- set provider = j.provider|string %}

           {%- if grains.kernel|lower in ('linux', 'darwin') %}
include:
  {{ '- .package.clean' if j[provider]['pkg']['use_upstream_package'] else '' }}
  {{ '- .macapp.clean' if j[provider]['pkg']['use_upstream_macapp'] else '' }}
  {{ '- .archive.clean' if j[provider]['pkg']['use_upstream_archive'] else '' }}
  - .config.clean

           {%- else %}

java-not-available-to-clean:
  test.show_notification:
    - text: |
        The java formula is unavailable/untested on {{ salt['grains.get']('finger', grains.os_family) }}

           {%- endif %}
