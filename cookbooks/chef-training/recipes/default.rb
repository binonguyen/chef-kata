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
    content "#{node["chef-training"]["yourName"]}build this"
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

chef_training_website 'custom resource' do
    action :create
end

m = data_bag_items('website','messages')
file '/var/website/welcome.txt' do
    content "#{m['welcomeMessage']}"
    owner 'root'
    group 'root'
    mode '0755'
    action :create
end





