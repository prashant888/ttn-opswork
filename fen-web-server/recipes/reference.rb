
package 'wordnet'
package 'units'
package 'proj-bin'

node.set['apache']['server_name'] = 'www.infoplease.com'

include_recipe 'fen-web-server'
include_recipe 'fen-web-server::global'

apache_conf 'url-cleanup' do
  enable false
  conf_path node['apache']['dir']
end

node.set['php']['include_path'] = %w[/site/lib]

instance = search('aws_opsworks_instance', 'self:true').first
hostname = instance[:hostname]

site = node['infoplease']
subdirs = {
    'www' => '',
    'dictionary' => '',
    'thesaurus' => ''
}

apache_conf '000-default' do
  enable true
end

vhost = 'www'
%w(infoplease factmonster).each do |sitegroup|
  domain = "#{sitegroup}.com"
  web_app "#{vhost}.#{domain}" do
    enable true
    virtual_host vhost
    domain_name domain
    server_name "#{vhost}.#{domain}"
    server_aliases [
      "#{hostname}.#{domain}",
      "#{hostname}.#{vhost}.#{domain}",
      "#{vhost}.#{hostname}.#{domain}",
      "#{hostname}-#{vhost}.#{domain}",
      "#{vhost}-#{hostname}.#{domain}",
      "aws.#{domain}",
      "ph.#{domain}",
      "sf.#{domain}",
   ]
    docroot "#{site['docroot']}#{subdirs[vhost]}"
    template "#{vhost}.#{domain}.conf.erb"
  end
end

%w(infoplease factmonster).each do |sitegroup|
  domain = "#{sitegroup}.com"
  %w(dictionary thesaurus).each do |vhost|
    web_app "#{vhost}.#{domain}" do
      enable true
      virtual_host vhost
      sitegroup sitegroup
      domain_name domain
      server_name "#{vhost}.#{domain}"
      server_aliases [
        "#{hostname}.#{vhost}.#{domain}",
        "#{vhost}.#{hostname}.#{domain}",
        "#{hostname}-#{vhost}.#{domain}",
        "#{vhost}-#{hostname}.#{domain}",
        "aws.#{vhost}.#{domain}",
        "#{vhost}.aws.#{domain}"
      ]
      docroot "#{site['docroot']}#{subdirs[vhost]}"
      template "#{vhost}.conf.erb"
    end
  end
end
