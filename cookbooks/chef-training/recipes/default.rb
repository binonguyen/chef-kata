package 'nano' do
  action :install
end

directory '/var/website' do
  action :create
end

directory '/var/old-website' do
  action :delete
end

file '/var/website/directions.txt' do
  content 'website goes here'
  action :create
end

file '/var/website/builder.txt' do
  content "#{node['yourname']} built this"
end

remote_file '/var/website/logo.jpg' do
  source 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgQmQ0CYwU3cpFE6gEB82cp6TSIcBJSisax_HVvEfsgYHGBsO8kQ'
  action :create
end


chef_training_website 'run command and git' do
  action :create
end


m = data_bag_item('website', 'messages')

file '/var/website/welcome.txt' do
  content "#{m['welcomeMessage']}"
  action :create
end

# execute 'command ran' do
#   command 'echo ran command > /var/website/command.txt'
#   not_if {::File.exist?('/var/website/command.txt')}
#   notifies :create, 'directory[/var/website/architect]', :immediately
#   notifies :install, 'package[git]', :immediately
#   notifies :create, 'bash[command git]', :immediately
# end
# directory '/var/website/architect' do
#   action :nothing
# end
# package 'git' do
#   action :nothing
# end
# bash 'git pull' do
#   cwd '/var/website/architect'
#   code <<-EOH
#     git init
#     git pull https://github.com/pages-themes/architect master
#     EOH
#   action :nothing
# end
