include_recipe 'ubuntu'

apt_package 'nano'

directory '/var/jenkins_home'

remote_file '/var/jenkins_home/author.jpg' do
  source 'https://github.com/anniehedgpeth/anniehedgpeth.github.io/blob/master/assets/images/author.jpg'
end

cookbook_file '/var/jenkins_home/directions.txt' do
  source 'directions.txt'
end

template '/var/jenkins_home/build.txt' do
  source 'build.txt.erb'
  variables( :builder => "#{node['cheftraining']['builder']}" )
end

execute 'echo' do
  command 'echo ran command > /var/jenkins_home/command.txt'
  not_if do ::File.exist?('/var/jenkins_home/command.txt') end
  # notifies :create, 'remote_file[/var/jenkins_home/1.rb]', :immediately
end

remote_file '/var/jenkins_home/1.rb' do
  source 'https://raw.githubusercontent.com/anniehedgpeth/inspec-workshop/master/controls/1.rb'
  action :nothing
  subscribes :create, 'execute[echo]', :immediately
end
