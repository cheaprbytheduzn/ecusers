# Cookbook Name:: ecusers
# Recipe:: cleanup
#
# Copyright 2014, Hewlett-Packard
#
# All rights reserved - Do Not Redistribute
#
# Remove Enterprise Chef users

pgsql =  {
   'name' => 'opscode-pgsql',
   'id' => node['ecusers']['ec-pgsql-id'],
   'group' => node['ecusers']['ec-pgsql-gid'],
   'home' => '/var/opt/opscode/postgresql',
   'shell' => '/bin/nologin'}
nagios = {
   'name' => 'opscode-nagios',
   'id' => node['ecusers']['ec-nagios-id'],
   'group' => node['ecusers']['ec-nagios-gid'],
   'home' => '/var/opt/opscode/nagios',
   'shell' => '/bin/nologin'}
nagios_cmd = {
   'name' => 'opscode-nagios-cmd',
   'id' => node['ecusers']['ec-nagios-cmd-id'],
   'group' => node['ecusers']['ec-nagios-cmd-gid'],
   'home' => '/var/opt/opscode/nagios',
   'shell' => '/bin/nologin'}

users = [ pgsql, nagios, nagios_cmd ]

puts users.inspect
users.each do |ecu|
  user ecu['name']  do
    uid ecu['id']
    action :remove
  end
  group ecu['name'] do
    gid ecu['group']
    action :remove
  end
end
