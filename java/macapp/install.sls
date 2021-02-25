# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as j with context %}

java-package-macapp-download:
  pkg.installed:
    - names: {{ j.pkg.deps|json }}
  file.directory:
    - names:
      - {{ j.path }}
      - {{ j.dir.tmp }}
    - user: {{ j.identity.rootuser }}
    - group: {{ j.identity.rootgroup }}
    - mode: 755
    - makedirs: True
    - require_in:
      - macapp: java-package-macapp-download
    - recurse:
        - user
        - group
        - mode
  cmd.run:
    - name: curl {{ j.pkg.cookieheader }} -Lo {{ j.dir.tmp }}/java-archive.dmg {{ j.pkg.macapp.source }}
    - hide_output: true
    - unless:
      - test -f {{ j.pkg.macapp.name }}
      - test -x {{ j.path }}/{{ '.jdk/Contents/Home/bin' if j[j.provider]['pkg']['use_upstream_macapp'] else 'bin' }}/java  # noqa 204
    - retry: {{ j.retry_option|json }}
  module.run:
    - name: file.check_hash
    - path: {{ j.dir.tmp }}/java-archive.dmg
    - file_hash: {{ j.pkg.macapp.source_hash }}
    - require:
      - cmd: java-package-macapp-download
    - require_in:
      - macpackage: java-package-macapp-install

java-package-macapp-install:
  #file.absent:
  #  - name: {{ j.dir.tmp }}/java-archive.dmg
  #  - onfail:
  #    - module: java-package-macapp-download
  macpackage.installed:
    - name: {{ j.dir.tmp }}/java-archive.dmg
    - store: False
    - dmg: True
    - app: False
    - force: True
    - allow_untrusted: True
    - onchanges:
      - cmd: java-package-macapp-download

    {%- if grains.os_family in ('MacOS') and j.commands %}
           {%- for cmd in j.commands %}

java-macapp-install-file-symlink-{{ cmd }}:
  file.symlink:
    - name: {{ j.dir.symlink }}/{{ cmd }}
    - target: {{ j.path }}/{{ '.jdk/Contents/Home/bin' if j[j.provider]['pkg']['use_upstream_macapp'] else 'bin' }}/{{ cmd }}  # noqa 204
    - force: True
    - require:
      - macpackage: java-package-macapp-install

           {%- endfor %}
    {%- endif %}
