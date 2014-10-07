# Cookbook Name:: ecusers
# Recipe:: cleanup
#
# Remove Enterprise Chef users

pgsql =  {
   'name' => 'opscode-pgsql',
   'group' => node['ecusers']['ec-pgsql-gid']
}

users = [pgsql]

support_features = {}
support_features[:manage_home] = node['ecusers']['manage-home-dir']
users.each do |ecu|
  user ecu['name']  do
    action :remove
    supports support_features
  end
  group ecu['name'] do
    gid ecu['group']
    action :remove
  end
end

if node['ecusers']['manage-opscode-user'] == true
  user 'opscode' do
    action :remove
    supports support_features
  end
  group 'opscode' do
    action :remove
  end
end
