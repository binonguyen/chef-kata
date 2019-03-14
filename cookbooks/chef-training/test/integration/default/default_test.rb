# # encoding: utf-8

# Inspec test for recipe chef-training::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end
# its('file_version') { should eq '1.2.3' }
# This is an example test, replace it with your own test.
describe port(80), :skip do
  it { should_not be_listening }
end
describe package('nano') do
  it { should be_installed }
end
describe directory('/var/website') do
  it { should exist }
end
describe directory('/var/old-website') do
  it { should_not exist }
end
describe file('/var/website/direction.txt') do
  its('content') { should eq 'website goes here' }
  it { should exist }
end
describe file('/var/website/builder.txt') do
  it { should exist }
end
describe file('/var/website/command.txt') do
  it { should exist }
end
describe directory('/var/website/architect') do
  it { should exist }
end
describe package('git') do
  it { should be_installed }
end