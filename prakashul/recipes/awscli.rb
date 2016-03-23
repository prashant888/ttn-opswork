
gem 'aws-sdk-v1'
#require 'aws-sdk-v1'

ec2 = AWS.ec2 #=> AWS::EC2
ec2.client #=> AWS::EC2::Client

resp = ec2.client.describe_tags(filters: [{ name: "key", values: ["CostCenter"] }])
#resp.each do |tag|
puts tag
