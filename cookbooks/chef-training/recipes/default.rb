#
# Cookbook:: chef-training
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

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
    content "#{node['chef-training']['my-name']} build this"
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

# execute 'echo command' do
#     command 'echo ran command > /var/website/command.txt'
#     not_if {::File.exist?('/var/website/command.txt')}
#     notifies :create, 'directory[/var/website/architect]', :immediately
    
#     notifies :install, 'package[git]', :immediately
    
#     notifies :run,'bash[git command]', :immediately
    
#     action :run
# end

# directory '/var/website/architect' do
#     owner 'root'
#     group 'root'
#     mode '0755'
#     action :nothing
# end
# package 'git' do
#     action :nothing
# end

# bash 'git command' do
#     code <<-EOH
#     git init
#     git pull https://github.com/pages-themes/architect master
#     EOH
#     action :nothing
# end

chef_training_website 'custom resource' do
    action :create
end
m = data_bag_item('website','messages')
file '/var/website/welcome.txt' do
    content "#{m['welcomeMessage']}"
    owner 'root'
    group 'root'
    mode '0755'
    action :create
end







