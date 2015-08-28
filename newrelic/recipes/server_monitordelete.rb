#execute 'removenr' do
#      command 'apt-get -y remove newrelic-sysmond'
#end

case node[:platform]
  when 'ubuntu', 'debian'
    package 'newrelic-sysmond' do
      action :remove
    end
end    
