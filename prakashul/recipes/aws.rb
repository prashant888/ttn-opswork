ruby_block "something" do
	block do
	        #tricky way to load this Chef::Mixin::ShellOut utilities
	        Chef::Resource::RubyBlock.send(:include, Chef::Mixin::ShellOut)
	        command = `aws ec2 describe-tags --filters 'Name=key,Values=CostCenter' --query 'Tags[*].[Value]' --output text | sort |uniq -d`
		command.split("\n").each do |instance_tag|
	        replacedX = instance_tag.sub(':', '-')
	        instance_id =`aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId]' --filters Name=instance-state-name,Values=running "Name=tag:CostCenter,Values=#{instance_tag}"`
		instance_id.split("\n").each do |instance_ids|
	        	instance_ip = `aws ec2 describe-instances --instance-ids #{instance_ids} --query 'Reservations[*].Instances[*].NetworkInterfaces[*].PrivateIpAddress' --output text`
			instance_name = `aws ec2 describe-instances --output text --instance-id #{instance_ids} --query "Reservations[*].Instances[*].Tags[?Key=='Name'].Value[]"`
			replacedNames = instance_name.sub(' ', '-')
			puts instance_ip
			puts replacedNames
	        #puts id
	        #puts replacedX
		end
	end
	
	    end
template "/etc/nagios3/services.d/#{files}.cfg" do
        source "services.erb"
        owner "root"
        group "root"
        mode "0755"
        variables( :files => files )
        end
end
