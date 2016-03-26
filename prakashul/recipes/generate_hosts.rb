bash 'generate_hosts' do
  cwd "/opt"
  code <<-EOH

#####AWS TAG
AWS_TAG_KEY=tag:CostCenter
region=us-east-1
##Nagios Host Dir Path Configuration 
nagios_path="/etc/nagios3/host.d"


###SCRIPT BEGIN

instance_tag=($(aws ec2 describe-tags --filters "Name=key,Values=CostCenter" --query 'Tags[*].[Value]' --output text --region $region | sort |uniq -d ))

for tag in ${instance_tag[@]}
	do

instance_id=$(aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId]' --filters Name=instance-state-name,Values=running "Name=$AWS_TAG_KEY,Values=$tag" --region $region  )

for InstanceId in ${instance_id[@]}
	do

tag_new=$(echo $tag| tr ':' '-')

###GENERATE HOST FILES PATH

if [ "$tag" == "Kids:Funbrain" ] ; then 

instance_ip=$(aws ec2 describe-instances --instance-ids $InstanceId --query 'Reservations[*].Instances[*].PublicIpAddress' --output text --region $region )

else 

instance_ip=$(aws ec2 describe-instances --instance-ids $InstanceId --query 'Reservations[*].Instances[*].PrivateIpAddress' --output text --region $region )
fi

instance_host=$(aws ec2 describe-instances --output text --instance-id $InstanceId --query 'Reservations[*].Instances[*].Tags[?Key==`Name`].Value[]' --region $region)

Host_file_Path="$nagios_path"/"$tag_new".cfg

instance_name=`echo $instance_host | tr ' ' '-'`

instance_name=`echo $instance_name | cut -d "(" -f2 | cut -d ")" -f1`

cat << EOF >> "$Host_file_Path"
define host{
        use                     generic-host            ; Name of host template to use
        host_name               $instance_name
        alias                   $instance_name
        address                 $instance_ip
        }
EOF
done
done

EOH
end
