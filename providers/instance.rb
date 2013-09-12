# encoding: utf-8

action :create do
  git_clone = git instance_dir(new_resource.name) do
    repository new_resource.git_repository
    revision new_resource.git_revision
    action :sync
    only_if { new_resource.git_repository }
  end

  new_resource.updated_by_last_action(git_clone.updated_by_last_action?)
end

action :remove do
  dir = directory instance_dir(new_resource.name) do
    action :delete
  end

  new_resource.updated_by_last_action(dir.updated_by_last_action?)
end
