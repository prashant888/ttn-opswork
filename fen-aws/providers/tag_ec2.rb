action :create do
# Load the databag that holds the AWS keys
  fen_aws = Chef::DataBagItem.load('fen-aws', 'access-keys')

  cost_center = new_resource.cost_center

# Iterate though all instances in the layer and assign the cost center
  search('aws_opsworks_instance').each do |instance|
    next unless instance.has_key?('ec2_instance_id')
    ec2_instance_id = instance['ec2_instance_id']
    Chef::Log.info("****** Tagging '#{ec2_instance_id}' for CostCenter #{cost_center} ******")
    aws_resource_tag ec2_instance_id do
      aws_access_key fen_aws['access_key_id']
      aws_secret_access_key fen_aws['secret_access_key']
      tags({:CostCenter => cost_center})
      action :update
    end
  end
end
