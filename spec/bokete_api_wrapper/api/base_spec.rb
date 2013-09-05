require 'spec_helper'

describe BoketeApiWrapper::Api::Base do
  describe :provider do
    let(:api_class) do
      Class.new(BoketeApiWrapper::Api::Base) do
        provider("popular")
      end
    end
    subject { api_class.new }
    #its(:client) { 
    #	should == :client 
    #}
  end
end
