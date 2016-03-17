
####USER VARIABLES##

host_file_path="/etc/nagios3/host.d"


        command = `aws ec2 describe-tags --filters 'Name=key,Values=CostCenter' --query 'Tags[*].[Value]' --output text | sort |uniq -d`
	command.split("\n").each do |instance_tag|
	        replacedTag = instance_tag.sub(':', '-')
	        instance_id =`aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId]' --filters Name=instance-state-name,Values=running "Name=tag:CostCenter,Values=#{instance_tag}"`
	
		instance_id.split("\n").each do |instance_ids|
	        	instance_ip = `aws ec2 describe-instances --instance-ids #{instance_ids} --query 'Reservations[*].Instances[*].NetworkInterfaces[*].PrivateIpAddress' --output text`
			instance_name = `aws ec2 describe-instances --output text --instance-id #{instance_ids} --query "Reservations[*].Instances[*].Tags[?Key=='Name'].Value[]"`
			#machineNames = instance_name.sub(' ', '')
			replacedNames = instance_name.sub('\n', '')
			machineNames = replacedNames.sub(' ', '-')
			puts instance_ip
			puts machineNames
	        #puts id
	        #puts replacedX


			template "#{host_file_path}/#{replacedTag}.cfg" do
			        source "hosts.erb"
			        owner "root"
			        group "root"
			        mode "0755"
			        variables( machineNames => machineNames,
					  instance_ip => instance_ip	 )
			
				end
			end
		end
