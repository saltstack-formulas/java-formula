java
====

This state installs java to /opt and sets up the alternatives system to point
to the binaries under /opt. To use this state the java tarball(s) must be
downloaded manually and placed in the files directory.

java.server_jre
---------------

Install the Oracle Java server jre, the tarball must be named `server_jre.tgz`
and placed in the files directory.
