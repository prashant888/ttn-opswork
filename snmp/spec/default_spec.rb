require 'spec_helper'

describe 'snmp::default' do
  shared_examples 'Enterprise Linux' do
    it 'installs net-snmp' do
      expect(chef_run).to install_package('net-snmp')
    end

    it 'starts and enables snmpd' do
      expect(chef_run).to start_service('snmpd')
      expect(chef_run).to enable_service('snmpd')
    end
  end

  context 'on Centos 6.5' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: 6.5).converge(described_recipe)
    end

    it_behaves_like 'Enterprise Linux'

    it 'installs net-snmp-utils' do
      expect(chef_run).to install_package('net-snmp-utils')
    end
  end

  context 'on Ubuntu 13.04 ' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: 13.04).converge(described_recipe)
    end

    it 'installs snmp' do
      expect(chef_run).to install_package('snmp')
    end

    it 'installs snmpd' do
      expect(chef_run).to install_package('snmpd')
    end

    it 'starts and enables snmpd' do
      expect(chef_run).to start_service('snmpd')
      expect(chef_run).to enable_service('snmpd')
    end
  end

  context 'on SUSE 11.3' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'suse', version: 11.3).converge(described_recipe)
    end

    it_behaves_like 'Enterprise Linux'
  end
end
