#!/bin/bash
####


##host & hostgroup path

path_group="/etc/nagios3/hostgroup.d"
path_host="/etc/nagios3/host.d"



instance_tag=($(aws ec2 describe-tags --filters "Name=key,Values=CostCenter" --query 'Tags[*].[Value]' --output text | sort |uniq -d))

for instance in ${instance_tag[@]}
	do

host_files=("$path_host"/"$instance".cfg)


instance_list1=`cat "$host_files"  |grep -i "host_name" |awk '{print $2}'|sed -e ':a;N;$!ba;s/\n/,/g'`


cat << EOF >> "$path_group"/"$instance".cfg
define hostgroup {
        hostgroup_name  $instance
        alias           $instance
        members         $instance_list1
                }
EOF
	done
