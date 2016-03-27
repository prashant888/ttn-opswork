########GENERATE BASIC AND ADVANCED CONTACTS######

template "/etc/nagios3/contacts.d/basic.cfg" do
source "contacts_basic.erb"
owner "root"
group "root"
mode "0755"
end


template "/etc/nagios3/contacts.d/advanced.cfg" do 
source "contacts_advanced.erb"
owner "root"
group "root"
mode "0755"
end
