resource_name :chef_training_website

property :home, String

action :create do
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
      git pull "#{node['link']}" master
      EOH
    action :nothing
  end

end
