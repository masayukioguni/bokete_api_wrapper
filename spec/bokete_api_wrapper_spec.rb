require 'spec_helper'

describe BoketeApiWrapper do
  describe :setup do
    # setup is called in spec_helper
    subject { BoketeApiWrapper.configuration }
    its(:endpoint) { should == "https://api.instagram.com/v1/"}
    its(:user_agent) { should == "BoketeApiWrapper Ruby Gem 0.0.1" }
    it { should be_dev }
  end
end

