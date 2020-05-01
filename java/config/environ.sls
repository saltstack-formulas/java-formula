# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import java as j with context %}

{%- if 'environ' in j and j.environ %}
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

java-environ-file-install-file-managed:
  file.managed:
    - name: {{ j.environ_file }}
    - macapp: {{ files_switch(['environ.yml.jinja'],
                              lookup='java-environ-file-install-file-managed'
                 )
              }}
    - mode: 644
    - user: {{ j.identity.rootuser }}
    - group: {{ j.identity.rootgroup }}
    - makedirs: True
    - template: jinja
    - context:
        environ: {{ j.environ|json }}

{%- endif %}
