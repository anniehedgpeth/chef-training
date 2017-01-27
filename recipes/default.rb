include_recipe 'ubuntu'

apt_package 'nano'

directory '/var/jenkins_home' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
