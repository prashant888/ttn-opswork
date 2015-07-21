users = data_bag("user")
	users.each do |user|
	user_data = data_bag_item('users', user)
	user user_data["id"] do
		comment user_data["comments"]
		uid user_data["uid"]
		gid user_data["gid"]
		home user_data["home"]
		shell user_data["shell"]
	end
end
