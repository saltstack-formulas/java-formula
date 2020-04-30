# frozen_string_literal: true

title 'java archives profile'

control 'java archive' do
  impact 1.0
  title 'should be installed'

  describe package('tar') do
    it { should be installed }
  end
  describe directory('/usr/lib/jvm/graalvm-ce-java8-20.0.0') do
    it { should exist }
  end
  describe directory('/tmp/java_tmp_salt') do
    it { should exist }
  end
  describe file('/tmp/java_tmp_salt/java-archive.tar.gz') do
    it { should exist }
  end
  describe file('/usr/lib/jvm/graalvm-ce-java8-20.0.0/bin/java') do
    it { should exist }
  end
  describe file('/etc/default/java.sh') do
    it { should exist }
  end
  describe file('/usr/local/bin/java') do
    it { should exist }
  end
end
