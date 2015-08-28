case node[:platform]
  when 'ubuntu', 'debian'
    package 'newrelic-sysmond' do
      action :remove
    end
end    
