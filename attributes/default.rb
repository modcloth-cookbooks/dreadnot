# encoding: utf-8

default['dreadnot']['install_nodejs'] = true

default['nodejs']['version'] = '0.6.21'
default['nodejs']['install_method'] = 'source'

case node['platform_family']
when 'smartos'
  default['nodejs']['install_nodejs'] = false
end

default['dreadnot']['user'] = 'dreadnot'
default['dreadnot']['group'] = 'dreadnot'
default['dreadnot']['gid'] = 849
default['dreadnot']['home'] = '/opt/dreadnot'
default['dreadnot']['shell'] = '/bin/bash'
