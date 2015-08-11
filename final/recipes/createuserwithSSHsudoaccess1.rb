users = data_bag("user")
users.each do |user|
        user_data = data_bag_item('user', user)
        user user_data["id"] do
                comment user_data["comments"]
                #uid user_data["uid"]
                #gid user_data["gid"]
                home user_data["home"]
                shell user_data["shell"]
                password user_data["password"]
                action :create
        end

        directory "#{user_data['home']}/.ssh" do
 	        mode 0755
 	        owner user_data["id"]
 	        action :create
        end

        file "#{user_data['home']}/.ssh/authorized_keys" do
 	        content user_data["ssh_keys"].join("\n")
 	        mode 0600
 	        owner user_data["id"]
 	        action :create
        end
	sudo user_data["id"] do
		user user_data["id"]
		runas "ALL"
		commands "ALL"
		passwordless true
 	end
        #line = "#{user_data["id"]}   ALL=(ALL) ALL"
        #file = Chef::Util::FileEdit.new('/etc/sudoers')
        #file.insert_line_if_no_match(/#{line}/, line)
        #file.write_file
end
