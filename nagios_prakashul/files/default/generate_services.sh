#!/bin/bash
#####

###DEFINE SERVICE ARRAYS



service_file_path="/etc/nagios3/services.d"


mkdir -p $service_file_path

for file in `ls /etc/nagios3/hostgroup.d/*.cfg` ; do file=`basename $file| awk -F. '{print $1}'`;echo $file;




cat << EOF >> "$service_file_path"/"$file".cfg
define service{
       use                             generic-service         ; Name of service template to use
       host_name                       $file
       service_description             Disk Space
       check_command                   check_all_disks!20%!10%
       }


define service{
       use                             generic-service         ; Name of service template to use
       host_name                       $file
       service_description             Current Users
       check_command                   check_users!20!50
       }


define service{
       use                             generic-service         ; Name of service template to use
       host_name                       $file
       service_description             Total Processes
       check_command                   check_procs!250!400
       }

define service{
       use                             generic-service         ; Name of service template to use
       host_name                       $file
       service_description             Current Load
       check_command                   check_load!5.0!4.0!3.0!10.0!6.0!4.0
       }
EOF
done

