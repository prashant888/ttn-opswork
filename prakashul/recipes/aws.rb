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
	puts command
    end
end
