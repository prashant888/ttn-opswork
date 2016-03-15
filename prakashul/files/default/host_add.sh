#!/bin/bash


#####AWS TAG
AWS_TAG_KEY=tag:CostCenter

##Nagios Host Dir Path Configuration 
nagios_path="/etc/nagios3/host.d"


###SCRIPT BEGIN

instance_tag=($(aws ec2 describe-tags --filters "Name=key,Values=CostCenter" --query 'Tags[*].[Value]' --output text | sort |uniq -d))

for tag in ${instance_tag[@]}
	do

instance_id=$(aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId]' --filters Name=instance-state-name,Values=running "Name=$AWS_TAG_KEY,Values=$tag")

for InstanceId in ${instance_id[@]}
	do

tag=$(echo $tag| tr ':' '-')

###GENERATE HOST FILES PATH

Host_file_Path="$nagios_path"/"$tag".cfg

instance_ip=$(aws ec2 describe-instances --instance-ids $InstanceId --query 'Reservations[*].Instances[*].NetworkInterfaces[*].PrivateIpAddress' --output text )

instance_host=$(aws ec2 describe-instances --output text --instance-id $InstanceId --query 'Reservations[*].Instances[*].Tags[?Key==`Name`].Value[]')

instance_name=`echo $instance_host | tr ' ' '-'`

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
