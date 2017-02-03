property :homepage, String, default: '<h1>Hello world!</h1>'

load_current_value do
  if ::File.exist?('/var/www/html/index.html')
    homepage IO.read('/var/www/html/index.html')
  end
end

action :create do
  remote_file '/var/jenkins_home/1.rb' do
    source 'https://raw.githubusercontent.com/anniehedgpeth/inspec-workshop/master/controls/1.rb'
    action :nothing
    subscribes :create, 'execute[echo]', :immediately
  end
end
