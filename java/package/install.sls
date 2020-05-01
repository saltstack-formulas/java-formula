# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import java as j with context %}
{%- set package = j.default.pkg.name %}

    {%- if grains.kernel|lower in ('linux',) %}
           {%- if j.default.pkg.use_upstream_repo %}
include:
  - .repo
           {%- endif %}

java-default-package-install:
  pkg.installed:
    - name: {{ j.default.pkg.name }}
    - reload_modules: true
    - onfail_in:
      - cmd: java-default-package-snap-install

java-default-package-snap-install:
  cmd.run:
    - name: snap install java-jre-ondra   # ?
    - onlyif: test -x /usr/bin/snap || test -x /usr/local/bin/snap

    {%- elif grains.os_family == 'MacOS' %}

java-default-package-homebrew-install:
  cmd.run:
    - names:
      - brew tap homebrew/cask-versions
      - brew cask install adoptopenjdk/openjdk/adoptopenjdk{{ j.release }}
    - runas: {{ j.identity.rootuser }}
    - onlyif: test -x /usr/local/bin/brew
    - onfail_in:
      - cmd: java-default-package-homebrew-reinstall

java-default-package-homebrew-reinstall:
  cmd.run:
    - name: brew cask reinstall adoptopenjdk/openjdk/adoptopenjdk{{ j.release }}
    - runas: {{ j.identity.rootuser }}

    {%- endif %}
