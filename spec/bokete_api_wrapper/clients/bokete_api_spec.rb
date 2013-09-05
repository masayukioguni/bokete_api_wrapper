require 'spec_helper'

describe BoketeApiWrapper::Clients::BoketeApi do
  let(:client) { described_class.new }
  subject { client }
  describe :build_url do
    subject { client.send(:build_url, 'popular') }
    it { should == "http://bokete.jp/boke/popular" }
  end
end
