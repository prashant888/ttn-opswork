#execute 'removenr' do
#      command 'apt-get -y remove newrelic-sysmond'
#end
package 'newrelic-sysmond' do
      action :remove
end      
