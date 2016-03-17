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
	command = `aws ec2 describe-tags --filters 'Name=key,Values=CostCenter' --query 'Tags[*].[Value]' --output text | sort |uniq -d`
command.split("\n").each do |instance_tag|
		instance_id =`aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId]' --filters Name=instance-state-name,Values=running "Name=tag:CostCenter,Values=#{instance_tag}"`
		replacedX = instance_tag.sub(':', '-')
		intance_ip = `aws ec2 describe-instances --instance-ids "#{instance_id}" --query 'Reservations[*].Instances[*].NetworkInterfaces[*].PrivateIpAddress' --output text`
		puts id
		puts replacedX
		puts intance_ip
		end

    end
end
