#ruby_block "something" do
#    block do
#        #tricky way to load this Chef::Mixin::ShellOut utilities
#        Chef::Resource::RubyBlock.send(:include, Chef::Mixin::ShellOut)      
#        command = "aws ec2 describe-tags --filters 'Name=key,Values=CostCenter' --query 'Tags[*].[Value]' --output text | sort |uniq -d"
#        command_out = shell_out(command)
#	puts command_out
#    end
#end


ruby_block "something" do
    block do
        #tricky way to load this Chef::Mixin::ShellOut utilities
        Chef::Resource::RubyBlock.send(:include, Chef::Mixin::ShellOut)      
	command = `aws ec2 describe-tags --filters 'Name=key,Values=CostCenter' --query 'Tags[*].[Value]' --output text --region 'us-east-1' | sort |uniq -d`
command.split("\n").each do |instance_tag|
		replacedX = instance_tag.sub(':', '-')
		instance_id =`aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId]' --filters Name=instance-state-name,Values=running "Name=tag:CostCenter,Values=#{instance_tag}" --region 'us-east-1'`
		instance_id.split("\n").each do |intance_ids|
		puts intance_ids
		intance_ip = `aws ec2 describe-instances --instance-ids "#{instance_id}" --query 'Reservations[*].Instances[*].NetworkInterfaces[*].PrivateIpAddress' --output text --region 'us-east-1'`
		#puts instance_id replacedX intance_ip
		#puts replacedX
		#puts intance_ip
		#puts intance_ips
		end
		end

    end
end
