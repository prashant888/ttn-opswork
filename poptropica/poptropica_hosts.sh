#!/bin/bash

AWS_TAG_KEY=tag:CostCenter
AWS_TAG_KEY_VALUE=Kids:Poptropica


##Nagios Host Dir Path Configuration 

nagios_path="/etc/nagios3/host.d"


##Host File Path 

instance_tag=($(aws ec2 describe-tags --filters "Name=key,Values=CostCenter" --query 'Tags[*].[Value]' --output text | sort |uniq -d))

for i in ${instance_tag[@]}
	do
Host_file_Path="$nagios_path/"$i".cfg"


################

instance_id=$(aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId]' --filters Name=instance-state-name,Values=running "Name=$AWS_TAG_KEY,Values=$i")

for InstanceId in ${instance_id[@]}
	do

instance_ip=$(aws ec2 describe-instances --instance-ids $InstanceId --query 'Reservations[*].Instances[*].NetworkInterfaces[*].PrivateIpAddress' --output text )

instance_host=$(aws ec2 describe-instances --output text --instance-id $InstanceId --query 'Reservations[*].Instances[*].Tags[?Key==`Name`].Value[]')

instance_name=`echo $instance_host | tr ' ' '-'`

echo $instance_name

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
