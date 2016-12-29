describe port(80) do
      it { should_not be_listening }
end

describe port(22) do
      it { should_not be_listening }
end

describe sshd_config do
       its('Ciphers') { should eq('chacha20-poly1305@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr') }
end

control "sshd-11" do
  impact 1.0
  title "Server: Set protocol version to SSHv2"
  desc "Set the SSH protocol version to 2. Don't use legacy
        insecure SSHv1 connections anymore."
  tag security: "level-1"
  tag "openssh-server"
  ref "Server Security Guide v.1.0", url: "http://..."

  describe sshd_config do
    its('Protocol') { should eq('2') }
  end
end

