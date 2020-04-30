# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import java as j with context %}

{%- if salt.pillar.get('java:cacert') %}
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

       {%- for ca in salt['pillar.fetch']('java:cacert', default=[] ) %}

java-cacert-install-{{ ca.alias }}-managed:
  file.managed:
    - name: {{ j.dir.tmp }}/{{ j.cacert_file }}
    - source: {{ ca.source }}
       {%- if ca.source_hash is defined %}
    - source_hash: {{ ca.source_hash }}
       {%- else %}
    - skip_verify: True
       {%- endif %}
    - unless: {{ j.dir.symlink }}/keytool -list -keystore {{ j.cacert_keystore }} -storepass {{ j.cacert_keystore_password }} | grep -qi {{ ca.fingeprint }}  # noqa 204
    - makedirs: True
    - require:
      {{ '- ' ~ sls_macapp_install if j[j.provider]['pkg']['use_upstream_macapp'] else '' }}
      {{ '- ' ~ sls_archive_install if j[j.provider]['pkg']['use_upstream_archive'] else '' }}
      {{ '- ' ~ sls_package_install if j[j.provider]['pkg']['use_upstream_package'] else '' }}
    - require_in:
      - file: java-cacert-install-{{ ca.alias }}-tidyup

java-cacert-install-{{ ca.alias }}-tidyup:
  file.absent:
    - name: {{ j.dir.tmp }}/{{ j.cacert_file }}

       {%- endfor %}
{%- endif %}
