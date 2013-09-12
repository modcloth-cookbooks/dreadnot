# encoding: utf-8

require 'json'

action :create do
  %W(
    #{node['dreadnot']['instance_prefix']}
    #{instance_dir(new_resource.name)}
  ).each do |dirname|
    directory dirname do
      owner node['dreadnot']['user']
      group node['dreadnot']['group']
      mode 0750
    end
  end

  template "#{instance_dir(new_resource.name)}/local_settings.js" do
    source node['dreadnot']['instance_template_file']
    cookbook node['dreadnot']['instance_template_cookbook']
    owner node['dreadnot']['user']
    group node['dreadnot']['group']
    variables(local_settings: new_resource.local_settings)
    mode 0640
  end

  (new_resource.local_settings['stacks'] || {}).each do |stack_name, stack_config|
    directory "#{instance_dir(new_resource.name)}/#{stack_name}" do
      owner node['dreadnot']['user']
      group node['dreadnot']['group']
      mode 0750
      only_if { stack_config['_stack_files'] }
    end

    (stack_config['_stack_files'] || {}).each do |filename, file_contents|
      file "#{instance_dir(new_resource.name)}/#{stack_name}/#{filename}" do
        content file_contents
        owner node['dreadnot']['user']
        group node['dreadnot']['group']
        mode 0640
      end
    end

    git "#{instance_dir(new_resource.name)}/#{stack_name}" do
      repository stack_config['_git_repository'] || 'https://example.org/foo/bar'
      revision stack_config['_git_revision']
      action :sync
      only_if do
        !(stack_config['_git_repository'] || '').empty? &&
          !(stack_config['_git_revision'] || '').empty?
      end
    end
  end
end

action :remove do
  directory instance_dir(new_resource.name) do
    action :delete
  end
end
