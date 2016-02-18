actions :create
default_action :create

attribute :name, kind_of: String, name_property: true
attribute :uid, kind_of: Integer, name_property: true
attribute :gid, kind_of: Integer, name_property: true
attribute :authorized_keys, kind_of: Array
attribute :home_volume, kind_of: String, :default => "#{node['fen']['local_accounts']['home_volume']}"
