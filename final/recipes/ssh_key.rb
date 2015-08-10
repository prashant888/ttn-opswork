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
