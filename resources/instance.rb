actions :create, :remove

attribute :local_settings, kind_of: Hash, required: true
attribute :instance_name, kind_of: String, name_attribute: true, regex: /^[-a-z_]+$/

default_action :create
