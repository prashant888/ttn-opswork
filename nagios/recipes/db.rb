inst_hostname = data_bag('aws_opsworks_instance').each do |hostname|
  data_bag_item('aws_opsworks_instance', hostname)["source"]
end
file '/home/ubuntu/file.txt' do
  variables(
    :inst_hostname => inst_hostname
end
