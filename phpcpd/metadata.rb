name             "phpcpd"
maintainer       "Escape Studios"
maintainer_email "dev@escapestudios.com"
license          "MIT"
description      "Installs/Configures phpcpd"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.6"

%w{ debian ubuntu redhat centos fedora scientific amazon }.each do |os|
supports os
end

depends "php5_ppa"

recipe "phpcpd", "Installs phpcpd."
recipe "phpcpd::composer", "Installs phpcpd using composer."
recipe "phpcpd::phar", "Installs phpcpd using phar."
