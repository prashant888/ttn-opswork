ruby_block "create hostsgroups" do
	 block do
                #tricky way to load this Chef::Mixin::ShellOut tilities
                Chef::Resource::RubyBlock.send(:include, Chef::Mixin::ShellOut)
		command = `aws ec2 describe-tags --filters 'Name=key,Values=CostCenter' --query 'Tags[*].[Value]' --output text | sort |uniq -d`
