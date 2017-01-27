include_recipe 'ubuntu'

apt_package 'nano'

directory '/var/jenkins_home' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

file '/var/jenkins_home/directions.txt' do
  content 'jenkins goes here'
  action :create
end

template '/var/jenkins_home/build.txt' do
  source 'build.txt.erb'
  variables( :builder => "#{node['cheftraining']['builder']}" )
end

