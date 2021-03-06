require 'spec_helper'

describe 'influxdb::server', :type => :class do

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
     end
    it { should contain_class('influxdb::server::install') }
    it { should contain_class('influxdb::repo') }
    it { should contain_class('influxdb::server::config') }
    it { should contain_class('influxdb::server::service') }
    case facts[:osfamily]
    when 'Debian'
      it { should contain_class('influxdb::repo::apt') }
    when 'RedHat'
      it { should contain_class('influxdb::repo::yum') }
    end
    end
  end

end