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
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
