
default['ecusers']['manage-opscode-user'] = true
  # Set to false to optionally manage the opscode user separately
default['ecusers']['manage-home-dir'] = true
  # When deleting the user(s) purge the home directory as well.

# Parent dirs of the home dirs of the several users:
default['ecusers']['parentdirs'] = ['/var/opt/opscode/']
default['ecusers']['opscode-parent'] = '/opt/opscode'

# User IDs:
default['ecusers']['ec-opscode-id'] = 651
default['ecusers']['ec-pgsql-id'] = 652
default['ecusers']['ec-nagios-id'] = 653
default['ecusers']['ec-nagios-cmd-id'] = 654

# Group IDs:
default['ecusers']['ec-opscode-gid'] = 651
default['ecusers']['ec-pgsql-gid'] = 652
default['ecusers']['ec-nagios-gid'] = 653
default['ecusers']['ec-nagios-cmd-gid'] = 654

# Home Dirs:
default['ecusers']['ec-opscode-home'] = '/opt/opscode/embedded'
default['ecusers']['ec-pgsql-home'] = '/var/opt/opscode/postgresql'
default['ecusers']['ec-nagios-home'] = '/var/opt/opscode/nagios'
default['ecusers']['ec-nagios-cmd-home'] = '/var/opt/opscode/nagio'

# Shells:
default['ecusers']['ec-opscode-shell'] = '/bin/sh'
default['ecusers']['ec-pgsql-shell'] = '/bin/sh'
default['ecusers']['ec-nagios-shell'] = '/bin/sh'
default['ecusers']['ec-nagios-cmd-shell'] = '/bin/sh'
