# frozen_string_literal: true

title 'java archives profile'

control 'java archive' do
  impact 1.0
  title 'should be installed'

  describe package('tar') do
    it { should be_installed }
  end
  describe directory('/usr/lib/jvm/jdk-8u251-b08') do
    it { should exist }
  end
  describe file('/usr/lib/jvm/jdk-8u251-b08/bin/java') do
    it { should exist }
  end
  describe file('/etc/default/java.sh') do
    it { should exist }
  end
  describe file('/usr/local/bin/java') do
    it { should exist }
  end
end
