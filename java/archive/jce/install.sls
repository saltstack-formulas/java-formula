# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import java as j with context %}

    {%- if j.pkg.jce_source and j.pkg.jce_source_hash %}

java-jce-package-archive-download:
  file.directory:
    - name: {{ j.dir.security }}
    - user: {{ j.identity.rootuser }}
    - group: {{ j.identity.rootgroup }}
    - mode: 755
    - makedirs: True
    - require_in:
      - archive: java-jce-package-archive-download
    - recurse:
        - user
        - group
        - mode
  cmd.run:
    - name: curl {{ j.pkg.cookieheader }} -Lo {{ j.dir.tmp }}/{{ j.pkg.name }}.zip {{ j.pkg.jce_source }}
    - unless: test -f {{ j.dir.tmp }}/{{ j.pkg.name }}.zip
    - retry: {{ j.retry_option|json }}

java-jce-package-backup-policy-us:
  cmd.run:
    - cwd: {{ j.dir.security }}
    - name: mv US_export_policy.jar US_export_policy.jar.nonjce.$$
    - creates:
      - US_export_policy.jar.nonjce.$$
    - onlyif: test -f US_export_policy.jar.nonjce
    - require:
      - cmd: java-jce-package-archive-download

java-jce-package-backup-policy-local:
  cmd.run:
    - cwd: {{ j.dir.security }}
    - name: mv local_export_policy.jar local_export_policy.jar.nonjce.$$
    - creates:
      - US_export_policy.jar.nonjce.$$
    - onlyif: test -f local_export_policy.jar.nonjce
    - require:
      - cmd: java-jce-package-archive-download

java-jce-package-archive-install:
  archive.extracted:
    - name: {{ j.dir.security }}/
    - source: file://{{ j.dir.tmp }}/{{ j.pkg.name }}.zip
    - format: zip
    - source_hash: {{ j.pkg.jce_source_hash }}
    - user: {{ j.identity.rootuser }}
    - group: {{ j.identity.rootgroup }}
    - require:
      - cmd: java-jce-package-archive-download

    {%- endif %}
