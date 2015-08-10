#
# Cookbook Name:: users
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
groups = data_bag_item("group")
search("groups","*:*").each do |group_data|
	group group_data["id"] do
		gid group_data["gid"]
		members group_data["members"]
	end
end
