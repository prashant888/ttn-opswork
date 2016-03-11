
instance = search("aws_opsworks_instance").each do |instance|

template "/etc/nagios3/\#{instance['private_ip']}.cfg" do
    source "hosts.cfg.erb"
    owner "root"
    group "root"
    mode "0644"
    variables(
        :instance => '#{instance['private_ip']}'
    )
end
