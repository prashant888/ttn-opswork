
file "/var/chef/cookbooks/prakashul/files/default/install_awscli.sh" do
  mode 0755
  user "root"
  mode "755"
end

execute "/var/chef/cookbooks/prakashul/files/default/install_awscli.sh" do
  command "sudo bash /var/chef/cookbooks/prakashul/files/default/install_awscli.sh"
end
