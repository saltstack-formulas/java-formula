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
  {{ '- ' ~ sls_macapp_install if j[j.provider]['pkg']['use_upstream_macapp'] else '' }}
  {{ '- ' ~ sls_archive_install if j[j.provider]['pkg']['use_upstream_archive'] else '' }}
  {{ '- ' ~ sls_package_install if j[j.provider]['pkg']['use_upstream_package'] else '' }}

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
    - require:
      {{ '- sls: ' ~ sls_macapp_install if j[j.provider]['pkg']['use_upstream_macapp'] else '' }}
      {{ '- sls: ' ~ sls_archive_install if j[j.provider]['pkg']['use_upstream_archive'] else '' }}
      {{ '- sls: ' ~ sls_package_install if j[j.provider]['pkg']['use_upstream_package'] else '' }}

{%- endif %}
