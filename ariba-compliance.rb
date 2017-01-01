describe port(80) do
      it { should_not be_listening }
end

describe port(22) do
      it { should_not be_listening }
end

describe sshd_config do
    its('Protocol') { should eq('2') }
end

describe sshd_config do
    its('SyslogFacility') { should eq('AUTHPRIV') }
end

describe user('root') do
     it { should not exist }
end

describe os[:family] do
      it { should eq 'centos' }
end

