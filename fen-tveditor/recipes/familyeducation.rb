#
# Cookbook Name:: fen-tveditor
# Recipe:: familyeducation
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

include_recipe "fen-web-server::familyeducation"

apache_conf 'famed-common' do
  enable false
  conf_path node['apache']['dir']
  image_host node['fen']['sitevars']['global']['IMAGE_HOST']
end

apache_conf 'namelab-common' do
  enable false
  conf_path node['apache']['dir']
  image_host node['fen']['sitevars']['global']['IMAGE_HOST']
end

# apache_conf 'ajp-proxy'
apache_conf 'logging'
apache_conf 'other-vhosts-access-log'

domain = 'familyeducation.com'

instance = search('aws_opsworks_instance', 'self:true').first
hostname = instance[:hostname]

sub = 'www'
web_app "#{sub}.#{domain}" do
  enable true
  domain domain
  sub sub
  server_aliases %W[dev.#{domain} #{sub}.*.#{domain} *.#{sub}.#{domain}]
  docroot node['fen-tveditor']['deploy_dir']
  image_host node['fen']['sitevars']['global']['IMAGE_HOST']
  template 'familyeducation.com.conf.erb'
end

subdomains = %w(costumes fun life printables quizzes recipes school)
subdomains.each do |sub|
  web_app "#{sub}.#{domain}" do
    enable true
    domain domain
    sub sub
    server_aliases %W[#{sub}.*.#{domain} www.#{sub}.#{domain} dev.#{sub}.#{domain} #{hostname}.#{sub}.#{domain}]
    docroot node['fen-tveditor']['deploy_dir']
    image_host node['fen']['sitevars']['global']['IMAGE_HOST']
    extras ''
    template 'subdomain.familyeducation.com.conf.erb'
  end
end

sub = 'pregnancy'
web_app "#{sub}.#{domain}" do
  enable true
  domain domain
  sub sub
  server_aliases %W[#{sub}.*.#{domain} www.#{sub}.#{domain} dev.#{sub}.#{domain} #{hostname}.#{sub}.#{domain}]
  docroot node['fen-tveditor']['deploy_dir']
  image_host node['fen']['sitevars']['global']['IMAGE_HOST']
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
  web_app "#{sub}.#{domain}" do
    enable true
    domain domain
    sub sub
    server_aliases %W[#{sub}.*.#{domain} www.#{sub}.#{domain} dev.#{sub}.#{domain} #{hostname}.#{sub}.#{domain}]
    docroot node['fen-tveditor']['deploy_dir']
    tomcat node['fen']['sitevars']['global']['SOLR_HOST']
    image_host node['fen']['sitevars']['global']['IMAGE_HOST']
    extras ''
    template 'namelab.conf.erb'
  end
end

sub = 'quiz'
web_app "#{sub}.#{domain}" do
  enable true
  server_aliases %W[#{sub}.*.#{domain} www.#{sub}.#{domain} dev.#{sub}.#{domain} #{hostname}.#{sub}.#{domain}]
  redirect_from '^/(.*)'
  redirect_to 'http://quizzes.familyeducation.com/$1'
  status 301
  template 'redirect-domain.conf.erb'
end

web_app 'www.maxsdaddy.com' do
  enable true
  server_aliases %w(maxsdaddy.com)
  redirect_from '^/(.*)'
  redirect_to 'http://school.familyeducation.com/math/new-teacher/54797.html'
  status 301
  template 'redirect-domain.conf.erb'
end

web_app 'www.mathsupportforparents.com' do
  enable true
  server_aliases %w(mathsupportforparents.com)
  redirect_from '^/(.*)'
  redirect_to 'http://fun.familyeducation.com/famed/coffeebreak/comics/MaxsDaddy.html'
  status 301
  template 'redirect-domain.conf.erb'
end

web_app 'homeschoolernetwork.com' do
  enable true
  template 'homeschoolernetwork.com.conf.erb'
end

include_recipe 'fen-tveditor::tv-platform-cron'
