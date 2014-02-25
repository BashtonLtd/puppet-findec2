require 'spec_helper'

describe 'findec2' do
  context 'supported operating systems' do
    ['RedHat'].each do |osfamily|
      describe "findec2 class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('findec2::params') }

        it { should contain_class('findec2::install') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'findec2 class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end

end
