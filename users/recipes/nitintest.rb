users = data_bag("user")
users.each do |user|
        user_data = data_bag_item('user', user)
        user user_data["id"] do
                comment user_data["comments"]
                uid user_data["uid"]
                gid user_data["gid"]
                home user_data["home"]
                shell user_data["shell"]
                action [ :modify, :create ]
        end

        directory "#{user_data['home']}/.ssh" do
 	        mode 0755
 	        owner user_data["id"]
 	        action [ :modify, :create ]
        end

        file "#{user_data['home']}/.ssh/authorized_keys" do
 	        content user_data["ssh_key"]
 	        mode 0600
 	        owner user_data["id"]
 	        action [ :modify, :create ]
        end
end