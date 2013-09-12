# encoding: utf-8

require 'json'

action :create do
  git "#{instance_dir(new_resource.name)}" do
    repository new_resource.git_repository
    revision new_resource.git_revision
    action :sync
    only_if { new_resource.git_repository }
  end
end

action :remove do
  directory instance_dir(new_resource.name) do
    action :delete
  end
end
