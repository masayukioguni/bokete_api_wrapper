require 'spec_helper'

describe BoketeApiWrapper::Api::User do
  let(:api) { described_class.new() }
  describe :get do
    it 'call api response' do
      stub_request(:get, "http://bokete.jp/user/dummy_user/boke?page=0").
      to_return(:status => 200, :body => mock_file("api/user/success.html"), :headers => {})
      api.get("dummy_user",0).should have(10).items
    end
    it 'other pages' do
      stub_request(:get, "http://bokete.jp/user/dummy_user/boke?page=1").
      to_return(:status => 200, :body => mock_file("api/user/success.html"), :headers => {})
      api.get("dummy_user",1).should have(10).items
    end
  end
end
