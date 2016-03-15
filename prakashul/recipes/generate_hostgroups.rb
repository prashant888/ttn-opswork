bash 'generate_hosts' do
  cwd "/opt"
  code <<-EOH

##host & hostgroup path

path_group="/etc/nagios3/hostgroup.d"
path_host="/etc/nagios3/host.d"

instance_tag=($(aws ec2 describe-tags --filters "Name=key,Values=CostCenter" --query 'Tags[*].[Value]' --output text | sort |uniq -d))

for tag in ${instance_tag[@]}
        do

tag=$(echo $tag| tr ':' '-')

host_files=("$path_host"/"$tag".cfg)

instance_list=`cat "$host_files"  |grep -i "host_name" |awk '{print $2}'|sed -e ':a;N;$!ba;s/\n/,/g'`

cat << EOF >> "$path_group"/"$tag".cfg
define hostgroup {
        hostgroup_name  $tag
        alias           $tag
        members         $instance_list
                }
EOF
        done
EOH
end
