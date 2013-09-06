require 'spec_helper'

describe BoketeApiWrapper::Api::Popular do
  let(:api) { described_class.new() }
  describe :get do
    it 'call api response' do
      stub_request(:get, "http://bokete.jp/boke/popular?page=0").
      to_return(:status => 200, :body => mock_file("api/popular/success.html"), :headers => {})
      api.get(0).should have(10).items
    end
    it 'other pages' do
      stub_request(:get, "http://bokete.jp/boke/popular?page=1").
      to_return(:status => 200, :body => mock_file("api/popular/success.html"), :headers => {})
      api.get(1).should have(10).items
    end
  end
end
