# frozen_string_literal: true

title 'java archives profile'

control 'java archive' do
  impact 1.0
  title 'should be installed'

  describe file('/etc/default/java.sh') do
    it { should exist }
  end
  # describe file('/usr/local/oracle/java-*/bin/java') do
  #   it { should exist }
  # end
  describe file('/usr/share/applications/java.desktop') do
    it { should exist }
  end
  describe file('/usr/local/bin/java') do
    it { should exist }
  end
end
