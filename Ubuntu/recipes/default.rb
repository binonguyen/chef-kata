package 'Nano' do
  action :install
end

directory '/var/website' do
  action :create
end

directory '/var/old-website' do
  action :delete
end

file '/var/website/direction.txt' do
  content 'website goes here'
  action :create
end

file 'var/website/builder.txt' do
  content "#{node['yourname']} build this"
  action :create
end

remote_file '/var/website/logo.html' do
  source 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgQmQ0CYwU3cpFE6gEB82cp6TSIcBJSisax_HVvEfsgYHGBsO8kQ'
  action :create
end

execute 'create command file' do
  command 'echo ran command > /var/website/command.txt'
  not_if { ::File.exist?("/var/website/command.txt") }
  notifies :create, 'directory[/var/website/architect]', :immediately
  notifies :install, 'package[git]', :immediately
  notifies :run, 'bash[git pull]', :immediately
end

directory '/var/website/architect' do
  action :nothing
end

package 'git' do
  action :nothing
end

bash 'git pull' do
  cwd '/var/website/architect'
  code <<-EOH
    git init
    git pull https://github.com/pages-themes/architect master
    EOH
  action :nothing
end
