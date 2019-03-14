package 'nano' do
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
file '/var/website/builder.txt' do
    content "#{node['builder']} build this "
    action :create
end

chef_training_website 'custom' do 
    action :create
end
m = data_bag_item('website', 'massages')
file '/var/website/welcome.txt' do
    content "#{m['welcomeMassage']}"
    action :create
end







