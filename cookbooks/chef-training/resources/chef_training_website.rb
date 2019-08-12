# To learn more about Custom Resources, see https://docs.chef.io/custom_resources.html
resource_name :chef_training_website
action :create do 
    execute 'echo command' do
        command 'echo ran command > /var/website/command.txt'
        not_if {::File.exist?('/var/website/command.txt')}
        notifies :install, 'package[git]', :immediately
        notifies :create, 'directory[/var/website/architect]', :immediately
        notifies :run, 'bash[git command]', :immediately
        action :run
    end
    
    package 'git' do
        action :nothing
    end
    
    directory '/var/website/architect' do
        owner 'root'
        group 'root'
        mode '0755'
        action :nothing
    end
    
    bash 'git command' do
        code <<-EOH
        git init
        git pull https://github.com/pages-themes/architect master
        EOH
        action :nothing
    end
    

end