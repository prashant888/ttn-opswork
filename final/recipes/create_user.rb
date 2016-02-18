users = data_bag("user")
users.each do |user|
        user_data = data_bag_item('user', user)
        user user_data["id"] do
                comment user_data["comments"]
                uid user_data["uid"]
                gid user_data["gid"]
                home user_data["home"]
                shell user_data["shell"]
                password user_data["password"]
                action :create
                not_if { user_data['home'].nil? }
        end
end
include_recipe "ssh_key"
