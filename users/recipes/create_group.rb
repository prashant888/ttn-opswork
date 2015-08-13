group = data_bag("group")
group.each do |group|
        group_data = data_bag_item("group", group)
        group group_data["gid"] do
                gid group_data["gid"]
                members group_data["members"] 
        end
end
#groups = data_bag_item("group")
#search("groups","*:*").each do |group_data|
#	group group_data["id"] do
		
#	end
#end
#
