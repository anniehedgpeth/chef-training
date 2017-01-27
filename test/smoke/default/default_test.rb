describe os[:family] do
  it { should eq 'debian' }
end

describe directory('/bin/nano') do
  it { should exist }
end

describe directory('/var/jenkins_home') do
  it { should exist }
end

describe directory('/var/teamcity') do
  it { should_not exist }
end

