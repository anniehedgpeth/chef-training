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
  action :run
  notifies :action, 'remote_file[/var/jenkins_home/drafts]'
end

remote_file '/var/jenkins_home/drafts' do
  source 'https://github.com/anniehedgpeth/anniehedgpeth.github.io/tree/master/_drafts'
end