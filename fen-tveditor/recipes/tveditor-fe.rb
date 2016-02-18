#
# Cookbook Name:: fen-tveditor
# Recipe:: tveditor
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'postgresql::client'
include_recipe 'fen-web-server'

apache_conf 'famed-common' do
  enable false
  conf_path node['apache']['dir']
end

apache_conf 'namelab-common' do
  enable false
  conf_path node['apache']['dir']
end

# apache_conf 'ajp-proxy'
apache_conf 'logging'
apache_conf 'other-vhosts-access-log'

domain = 'familyeducation.com'

instance = search('aws_opsworks_instance', 'self:true').first
hostname = instance[:hostname]

tve = 'tveditor.'
dev = 'dev.'

sub = 'www'
web_app "#{tve}#{sub}.#{domain}" do
  enable true
  domain domain
  sub sub
  server_name "#{tve}#{sub}.#{domain}"
  server_aliases ["#{tve}.#{domain}", "#{tve}#{dev}#{domain}", "#{tve}#{hostname}.#{domain}",
    "#{dev}#{tve}#{domain}", "#{tve}#{dev}#{sub}.#{domain}", "#{dev}#{tve}#{sub}.#{domain}",
    "#{hostname}#{tve}#{domain}", "#{hostname}#{tve}#{sub}.#{domain}"]
  docroot node['fen-tveditor']['deploy_dir']
  template 'familyeducation.com.conf.erb'
end

subdomains = %w(costumes fun life printables quizzes recipes school)
subdomains.each do |sub|
  web_app "#{tve}#{sub}.#{domain}" do
    enable true
    server_name "#{tve}#{sub}.#{domain}"
    domain domain
    sub sub
    server_aliases ["#{tve}#{sub}.#{dev}#{domain}", "#{tve}#{sub}.#{hostname}.#{domain}",
      "#{dev}#{tve}#{sub}.#{domain}", "#{hostname}#{tve}#{sub}.#{domain}"]
    docroot node['fen-tveditor']['deploy_dir']
    extras ''
    template 'subdomain.familyeducation.com.conf.erb'
  end
end

sub = 'pregnancy'
web_app "#{tve}#{sub}.#{domain}" do
  enable true
  domain domain
  sub sub
  server_name "#{tve}#{sub}.#{domain}"
  server_aliases ["#{tve}#{sub}.#{dev}#{domain}", "#{tve}#{sub}.#{hostname}.#{domain}",
    "#{dev}#{tve}#{sub}.#{domain}", "#{hostname}#{tve}#{sub}.#{domain}"]
  docroot node['fen-tveditor']['deploy_dir']
  extras <<-END
  # redirects for trimester pages
  RewriteRule ^/first-trimester(/)?$  /lesson-plans/lesson-66236.html
  RewriteRule ^/second-trimester(/)?$ /lesson-plans/lesson-66237.html
  RewriteRule ^/third-trimester(/)?$  /lesson-plans/lesson-66238.html
END
  template 'subdomain.familyeducation.com.conf.erb'
end

subdomains = %w(baby-names genealogy)
subdomains.each do |sub|
  web_app "#{tve}#{sub}.#{domain}" do
    enable true
    domain domain
    sub sub
    server_name "#{tve}#{sub}.#{domain}"
    server_aliases ["#{tve}#{sub}.#{dev}#{domain}", "#{tve}#{sub}.#{hostname}.#{domain}",
      "#{dev}#{tve}#{sub}.#{domain}", "#{hostname}#{tve}#{sub}.#{domain}"]
    docroot node['fen-tveditor']['deploy_dir']
    tomcat node['fen']['sitevars']['global']['SOLR_HOST']
    extras ''
    template 'namelab.conf.erb'
  end
end

sub = 'quiz'
web_app "#{tve}#{sub}.#{domain}" do
  enable true
  server_name "#{tve}#{sub}.#{domain}"
  server_aliases ["#{tve}#{sub}.#{dev}#{domain}", "#{tve}#{sub}.#{hostname}.#{domain}",
    "#{dev}#{tve}#{sub}.#{domain}", "#{hostname}#{tve}#{sub}.#{domain}"]
  redirect_from '^/(.*)'
  redirect_to 'http://quizzes.familyeducation.com/$1'
  status 301
  template 'redirect-domain.conf.erb'
end
