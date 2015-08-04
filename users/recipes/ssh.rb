users = data_bag("user")
	users.each do |user|
	user_data = data_bag_item('user', user)
	user user_data["id"] do
		comment user_data["comments"]
		uid user_data["uid"]
		gid user_data["gid"]
		home user_data["home"]
		shell user_data["shell"]
		execute "add pub key" do
			command "if [ ! -d /home/#{node['user']}/.ssh ]; then mkdir /home/#{node['user']}/.ssh; fi"
			command "echo #{node['pub_key']} >> ~#{node['user']}/.ssh/authorized_keys"
       			not_if "grep #{node['pub_key']} ~#{node['user']}/.ssh/authorized_keys"
       		end
	end
end
