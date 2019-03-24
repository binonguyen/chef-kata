# To learn more about Custom Resources, see https://docs.chef.io/custom_resources.html
resource_name :chef_training_website
action :create do
    execute 'echo command' do
        command 'echo ran command > /var/website/command.txt'
        not_if {::File.exists?('/var/website/command.txt')}
        notifies :install, 'package[git]', :immediately
        notifies :create, 'directory[/var/website/architect]', :immediately
        notifies :run, 'bash[git command]', :immediately
        action :run
    end
    package 'git' do
        action :nothing
    end
    directory '/var/website/architect' do
        action :nothing
    end
    bash 'git command' do
        cwd '/var/website/architect'
        code <<-EOH
        git init
        git pull "#{node['link']}" master
        EOH
        action :nothing
    end 
end