describe file('/etc/config/network') do
    it { should exist }
    it { should be_symlink }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
end
