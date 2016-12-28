describe port(80) do
      it { should_not be_listening }
end

describe sshd_config do
       its('Ciphers') { should eq('chacha20-poly1305@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr') }
end
