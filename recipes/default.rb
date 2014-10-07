# Cookbook Name:: ecusers
# Recipe:: default
#
# Create Enterprise Chef users

pgsql =  {
   'name' => 'opscode-pgsql',
   'id' => node['ecusers']['ec-pgsql-id'],
   'group' => node['ecusers']['ec-pgsql-gid'],
   'home' => node['ecusers']['ec-pgsql-home'],
   'shell' => node['ecusers']['ec-pgsql-shell']
}

users = [pgsql]

node['ecusers']['parentdirs'].each do |dir|
  directory dir do
    recursive true
  end
end

if node['ecusers']['manage-opscode-user'] == true
  directory node['ecusers']['opscode-parent'] do
    recursive true
  end
  group 'opscode' do
    gid node['ecusers']['ec-opscode-gid']
  end
  user 'opscode' do
    uid node['ecusers']['ec-opscode-id']
    gid node['ecusers']['ec-opscode-gid']
  end
end

puts users.inspect
users.each do |ecu|
  group ecu['name'] do
    gid ecu['group']
  end
  user ecu['name']  do
    comment 'Enterprise Chef Service Account'
    uid ecu['id']
    gid ecu['group']
    home ecu['home']
    shell ecu['shell']
  end
end
