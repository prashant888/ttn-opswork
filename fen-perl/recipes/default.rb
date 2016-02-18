#
# Cookbook Name:: fen-perl
# Recipe:: default
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

# Install perl
package 'perl' do
  action :install
end

# Install the packages
node['perl']['packages'].each do |perl_package, flag|
  if flag
    Chef::Log.info("Installing Perl package #{perl_package}")
    package perl_package do
      action :install
    end  
  end
end
