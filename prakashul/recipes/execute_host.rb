
file "/var/chef/cookbooks/prakashul/files/default/host_add.sh" do
  mode 0755
  user "root"
  mode "755"
end

execute "/var/chef/cookbooks/prakashul/files/default/host_add.sh" do
  command "sudo bash /var/chef/cookbooks/prakashul/files/default/host_add.sh"
end
