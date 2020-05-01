# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import java as j with context %}
{%- set package = j.default.pkg.name %}

    {%- if grains.kernel|lower in ('linux',) %}
           {%- if j.default.pkg.use_upstream_repo %}
include:
  - .repo.clean
           {%- endif %}

java-default-package-clean:
  pkg.removed:
    - name: {{ j.default.pkg.name }}
  cmd.run:
    - name: snap remove java-jre-ondra
    - onlyif: test -x /usr/bin/snap || test -x /usr/local/bin/snap

    {%- elif grains.os_family == 'MacOS' %}

java-default-package-homebrew-clean:
  cmd.run:
    - name: brew cask uninstall adoptopenjdk/openjdk/adoptopenjdk{{ j.release }}
    - runas: {{ j.identity.rootuser }}
    - onlyif: test -x /usr/local/bin/brew

    {%- endif %}
