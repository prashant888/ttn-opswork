fen-aws Cookbook
================
Sets up AWS environment, including instance credentials and FEN Cost Centers.

Possible Cost Centers:
* Kids:Funbrain
* Kids:Poptropica
* Kids:Shared
* Learning:Familyeducation
* Learning:Teachervision
* Learning:Infoplease
* Learning:Factmonster
* Learning:Shared
* Fen:GlobalOps
* Fen:Finance
* Fen:Sales

Requirements
------------
TODO: List your cookbook requirements. Be sure to include any requirements this cookbook has on platforms, libraries, other cookbooks, packages, operating systems, etc.

### cookbooks
- `aws` - fen-aws needs aws from supermarket.

Attributes
----------
None.

Usage
-----
#### fen-aws::default

    include_recipe 'aws::default'
    require 'chef/data_bag'

    # Load the databag that holds the AWS keys
    fen_aws = Chef::DataBagItem.load('fen-aws', 'access-keys')

    # Tag the instance
    aws_resource_tag node['ec2']['instance_id'] do
      aws_access_key fen_aws['access_key_id']
      aws_secret_access_key fen_aws['secret_access_key']
      tags({"CostCenter" => "Learning:Shared"})
      action :update
    end

### fen-aws::learning

    include_recipe 'aws::learning'


License and Authors
-------------------
License: Property of Family Education Network; All rights reserved.

Authors:
- Erich Beyrent <erich.beyrent@fen.com>
- Karl DeBisschop <karl.debisschop@fen.com>
