def instance_dir(new_resource_name)
  "#{node['dreadnot']['instance_prefix']}/#{new_resource_name}"
end
