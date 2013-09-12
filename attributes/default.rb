# encoding: utf-8

case node['platform_family']
when 'debian'
  default['nodejs']['install_method'] = 'package'
when 'smartos'
  default['nodejs']['install_method'] = 'package'
else
  default['nodejs']['install_method'] = 'source'
end

default['dreadnot']['user'] = 'dreadnot'
default['dreadnot']['group'] = 'dreadnot'
default['dreadnot']['gid'] = 849
default['dreadnot']['home'] = '/opt/dreadnot'
default['dreadnot']['shell'] = '/bin/bash'
