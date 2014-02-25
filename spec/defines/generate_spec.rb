require 'spec_helper'

describe "findec2::generate" do
  let(:title) { 'test' }
  let(:params) {{ :template => '/etc/find-ec2/templates/varnish.template',
                  :output   => '/etc/varnish/test.vcl' }}
  let(:facts) {{ :osfamily => 'RedHat' }}

  it { should contain_class('findec2') }
  it { should contain_cron('test') }
end
