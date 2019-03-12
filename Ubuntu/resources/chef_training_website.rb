resource_name :chef_training_website

action :create do

  execute 'run command echo' do
    command 'echo ran command > /var/website/command.txt'
    not_if {::File.exist?("/var/website/command.txt")}
    action :run
    notifies :install, 'package[git]', :immediately
    notifies :create, 'directory[/var/website/architect]', :immediately
    notifies :run, 'bash[run command git]', :immediately
  end
  package 'git' do
    action :nothing
  end
  directory '/var/website/architect' do
    action :nothing
  end
  bash 'run command git' do
    cwd '/var/website/architect'
    code <<-EOH
    git init
    git pull "#{node['link']}" master
    EOH
    action :nothing
  end

end
