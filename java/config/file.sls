# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import java as j with context %}

{%- if 'config' in j and j.config %}
       {%- set sls_archive_install = tplroot ~ '.archive' %}
       {%- set sls_macapp_install = tplroot ~ '.macapp' %}
       {%- set sls_package_install = tplroot ~ '.package' %}
       {%- from tplroot ~ "/libtofs.jinja" import files_switch with context %}

include:
       {%- if j[j.provider]['pkg']['use_upstream_archive'] %}
  - {{ sls_archive_install }}
       {%- elif j[j.provider]['pkg']['use_upstream_macapp'] %}
  - {{ sls_macapp_install }}
       {%- else %}
  - {{ sls_package_install }}
       {%- endif %}

java-config-file-install-file-managed:
  file.managed:
    - name: {{ j.config_file }}
    - macapp: {{ files_switch(['config.yml.jinja'],
                              lookup='java-config-file-install-file-managed'
                 )
              }}
    - mode: 644
    - user: {{ j.identity.rootuser }}
    - group: {{ j.identity.rootgroup }}
    - makedirs: True
    - template: jinja
    - context:
        config: {{ j.config|json }}

{%- endif %}
