case node['platform']
    when "debian", "ubuntu", "redhat", "centos", "fedora", "scientific", "amazon"
        package "wget" do
          action:install
        end

end

case node['platform']
    when "debian", "ubuntu"
        #trust the New Relic GPG Key
        #this step is required to tell apt that you trust the integrity of New Relic's apt repository
        gpg_key_id = "548C16BF"
        gpg_key_url = "http://download.newrelic.com/#{gpg_key_id}.gpg"

        execute "newrelic-add-gpg-key" do
            command "wget -O - #{gpg_key_url} | apt-key add -"
            notifies :run, "execute[newrelic-apt-get-update]", :immediately
            not_if "apt-key list | grep #{gpg_key_id}"
        end

        #configure the New Relic apt repository
        remote_file "/etc/apt/sources.list.d/newrelic.list" do
            source "http://download.newrelic.com/debian/newrelic.list"
            owner "root"
            group "root"
            mode 0644
            notifies :run, "execute[newrelic-apt-get-update]", :immediately
            action :create_if_missing
        end

        #update the local package list
        execute "newrelic-apt-get-update" do
            command "apt-get update"
            action :nothing
        end

        execute 'apt-get install newrelic-sysmond' do 
            command "apt-get -y install newrelic-sysmond"
        end
        
        line = "nrsysmond-config --set license_key=8752f60bb993ae23f4a7bb24644797a971819a5a"
        file = Chef::Util::FileEdit.new('/etc/newrelic/nrsysmond.cfg')
        file.insert_line_if_no_match(/#{line}/, line)
        file.write_file

        execute 'start-sysmond' do
            command "/etc/init.d/newrelic-sysmond start"
        end


end
