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
   content "#{node['builder']}  build this "
   action :create
 end

remote_file '/var/website/logo.jpg' do
  source 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgQmQ0CYwU3cpFE6gEB82cp6TSIcBJSisax_HVvEfsgYHGBsO8kQ'
  action :create
end
chef_training_website "custom resource " do
  action :create
end

i = data_bag_item('website', 'messages')
file '/var/website/welcome.txt' do
  content "#{i['welcomeMessage']}"
end
# execute 'run command echo' do
#     command 'echo ran command > /var/website/command.txt'
#     not_if {::File.exist?("/var/website/command.txt")}
#     action :run
#     notifies :install, 'package[git]', :immediately
#     notifies :create, 'directory[/var/website/architect]', :immediately
#     notifies :run, 'bash[run command git]', :immediately
# end
# package 'git' do
#     action :nothing
# end
# directory '/var/website/architect' do
#     action :nothing
# end
# bash 'run command git' do
#     cwd '/var/website/architect'
#     code <<-EOH
#     git init
#     git pull https://github.com/pages-themes/architect master
#     EOH
#     action :nothing
# end
