require 'spec_helper'

describe BoketeApiWrapper::Clients::BoketeApi do
  let(:client) { described_class.new }
  subject { client }
  describe :build_url do
    subject { client.send(:build_url, 'hello/world') }
    it { should == "http://https/api.instagram.com/v1/hello/world" }
  end
end
