
cookbook_file "/opt/host_add.sh" do
  source "host_add.sh"
  mode 0755
end

execute "host_add.sh" do
  user "root"
  cwd "/opt"
  command "bash host_add.sh"
end
