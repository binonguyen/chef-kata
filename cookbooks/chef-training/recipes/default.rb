package 'nano' do
    action :install
end
directory '/var/website' do
    owner 'root'
    group 'root'
    mode '0755'
    action :create
end
directory '/var/old-website' do
    owner 'root'
    group 'root'
    mode '0755'
    action :delete
end
file '/var/website/directions.txt' do
    content 'website goes here'
    owner 'root'
    group 'root'
    mode '0755'
    action :create
end
file '/var/website/builder.txt' do
    content "#{node['builder']} bui this "
    owner 'root'
    group 'root'
    mode '0755'
    action :create
end
remote_file '/var/website/logo.jpg' do
    source 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgQmQ0CYwU3cpFE6gEB82cp6TSIcBJSisax_HVvEfsgYHGBsO8kQ'
    owner 'root'
    group 'root'
    mode '0755'
    action :create
end

chef_web_training 'custom' do 
    action :create
end

message = data_bag_item('website', 'messages')
file '/var/website/welcome.txt' do
    content "#{message['welcomeMessage']}"
    owner 'root'
    group 'root'
    mode '0755'
    action :create
end



