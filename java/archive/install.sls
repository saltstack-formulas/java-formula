# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import java as j with context %}

java-package-archive-install:
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
      - archive: java-package-archive-install
    - recurse:
        - user
        - group
        - mode
  cmd.run:
    - name: curl {{ j.pkg.cookieheader }} -Lo {{ j.dir.tmp }}/java-archive.tar.gz {{ j.pkg.archive.source }}
    - unless: test -f {{ j.dir.tmp }}/java-archive.tar.gz
    - retry: {{ j.retry_option|json }}
  archive.extracted:
    - name: {{ j.path }}/
    - source: file://{{ j.dir.tmp }}/java-archive.tar.gz
    - format: tar
    - source_hash: {{ j.pkg.archive.source_hash }}
    - enforce_toplevel: false
    - trim_output: true
    - options: '--strip-components=1'
    - user: {{ j.identity.rootuser }}
    - group: {{ j.identity.rootgroup }}
    - require:
      - cmd: java-package-archive-install

java-package-archive-remove-unneeded-archive:
  file.absent:
    - name: {{ j.dir.tmp }}/java-archive.tar.gz

    {%- if j.linux.altpriority|int == 0 or grains.os_family in ('Arch', 'MacOS') and j.commands %}
           {%- for cmd in j.commands %}

java-archive-install-file-symlink-{{ cmd }}:
  file.symlink:
    - name: {{ j.dir.symlink }}/{{ cmd }}
    - target: {{ j.pkg.archive.name }}/{{ '.jdk/Contents/Home/bin' if grains.os == 'MacOS' else 'bin' }}/{{ cmd }}
    - force: True
    - require:
      - archive: java-package-archive-install

           {%- endfor %}
    {%- endif %}
