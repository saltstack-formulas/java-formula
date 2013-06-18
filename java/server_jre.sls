server_jre_tar:
  file.managed:
{% if pillar['java']['source'] is defined -%}
    - name: /opt/server_jre.tgz
    - source: {{ pillar['java']['source'] }}
    - source_hash: {{ pillar['java']['source_hash'] }}
{% else -%}
    - name: /opt/server_jre.tgz
    - source: salt://java/files/server_jre.tgz
{% endif -%}
  cmd.run:
    - name: tar xvf /opt/server_jre.tgz -C /opt
    - require:
      - file: server_jre_tar
