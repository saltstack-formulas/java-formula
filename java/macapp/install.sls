# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import java as j with context %}

java-package-macapp-install:
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
      - macapp: java-package-macapp-install
    - recurse:
        - user
        - group
        - mode
  cmd.run:
    - name: curl {{ j.pkg.cookieheader }} -Lo {{ j.dir.tmp }}/{{ j.pkg.name }}.dmg {{ j.pkg.macapp.source }}
    - unless: test -f {{ j.pkg.macapp.name }}
    - retry: {{ j.retry_option|json }}
  module.run:
    - name: file.check_hash
    - path: {{ j.dir.tmp }}/{{ j.pkg.name }}.dmg
    - file_hash: {{ j.pkg.macapp.source_hash }}
    - require:
      - cmd: java-package-macapp-install
    - require_in:
      - macpackage: java-package-macapp-install
  file.absent:
    - name: {{ j.dir.tmp }}/{{ j.pkg.name }}.dmg
    - onfail:
      - module: java-package-macapp-install
  macpackage.installed:
    - name: {{ j.dir.tmp }}/{{ j.pkg.name }}.dmg
    - store: False
    - dmg: True
    - app: False
    - force: True
    - allow_untrusted: True

    {%- if grains.os_family in ('MacOS') and j.commands %}
           {%- for cmd in j.commands %}

java-macapp-install-file-symlink-{{ cmd }}:
  file.symlink:
    - name: {{ j.dir.symlink }}/{{ cmd }}
    - target: {{ j.path }}/{{ '.jdk/Contents/Home/bin' if j[provider]['pkg']['use_upstream_macapp'] else 'bin' }}/{{ cmd }}  # noqa 204
    - force: True
    - require:
      - macpackage: java-package-macapp-install

           {%- endfor %}
    {%- endif %}
