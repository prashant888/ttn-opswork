require 'json'
volume_id = "vol-12345678"
region = "us-east-1"
command = ""
case node[:platform]
when 'debian','ubuntu'
  command << "/usr/local/bin/"
when 'redhat','centos','fedora','amazon','scientific'
  command << "/usr/bin/"
end
command << "aws --region #{region} ec2 describe-volumes --volume-ids #{volume_id} --output json"
Chef::Log.info("Waiting for volume #{volume_id} to be available")
loop do
  state=""
  shell = Mixlib::ShellOut.new("#{command} 2>&1")
  shell.run_command
  if !shell.exitstatus
    Chef::Log.fatal(output)
    raise "#{command} failed:" + shell.stdout
  end
  jdoc = JSON.parse(shell.stdout)
  vol_state = jdoc["Volumes"].first["State"]
  Chef::Log.debug("#{volume_id} is #{vol_state}")
  if state=="available"
    break
  else
    Chef::Log.debug("Waiting 5 more seconds for volume #{volume_id} to be ready...")
    sleep 5
  end
end
