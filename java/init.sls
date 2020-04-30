# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import java as j with context %}
{%- set provider = j.provider|string %}

           {%- if grains.kernel|lower in ('linux', 'darwin') %}

include:
  {{ '- .package' if j[provider]['pkg']['use_upstream_package'] else '' }}
  {{ '- .macapp' if j[provider]['pkg']['use_upstream_macapp'] else '' }}
  {{ '- .archive' if j[provider]['pkg']['use_upstream_archive'] else '' }}
  - .config

           {%- else %}

java-not-available-to-install:
  test.show_notification:
    - text: |
        The java formula is unavailable/untested on {{ salt['grains.get']('finger', grains.os_family) }}

           {%- endif %}
