server_jre_tar:
  file.managed:
    - name: /opt/server_jre.tgz
    - source: salt://java/files/server_jre.tgz

extract_server_jre:
  cmd.run:
    - name: tar xvf /opt/server_jre.tgz -C /opt
    - require:
      - file: server_jre_tar
