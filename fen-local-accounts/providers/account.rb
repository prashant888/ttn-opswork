
action :create do
  name = new_resource.name
  authorized_keys = new_resource.authorized_keys
  home_volume = new_resource.home_volume
  uid = new_resource.uid
  gid = new_resource.gid

  home_dir = "#{home_volume}/#{name}"

  # create the group
  group name do
    gid gid
  end

  # Create the user account
  user_home = "#{home_dir}"
  user name do
    manage_home true
    home user_home
    shell '/bin/bash'
    uid uid
    gid gid
  end

  # Create the .ssh directory in the user's home directory
  directory "#{home_dir}/.ssh" do
    action :create
    owner name
    group name
    mode '0700'
    recursive true
  end

  # Create the authorized_keys file
  template "#{home_dir}/.ssh/authorized_keys" do
    source 'authorized_keys.erb'
    owner name
    group name
    mode '0644'
    variables({:ssh_keys => authorized_keys})
  end
end
