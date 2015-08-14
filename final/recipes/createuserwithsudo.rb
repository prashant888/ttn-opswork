users = data_bag("user")
users.each do |user|
    user_data = data_bag_item("user", user)
        user user_data["id"] do
                comment user_data["comments"]
                #uid user_data["uid"]
                #gid user_data["gid"]
                home user_data["home"]
                shell user_data["shell"]
                password user_data["password"]
                supports :manage_home => true
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
	if user_data["sudo"] == "true"
		template "/etc/sudoers.d/#{user_data["id"]}" do
       		source "sudoers.erb"
       		mode "0644"
       		variables({
     		:sudoers_users => user_data["id"]
  		})
		end
	end
end
