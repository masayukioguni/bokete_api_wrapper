require File.expand_path('../version', __FILE__)

module BoketeApiWrapper
  class Configuration
    attr_accessor :dev ,:host , :user_agent
    def dev? ; @dev ||= false ; end

    def initialize(options={})
      @host  = 'bokete.jp'.freeze
      @user_agent =  "BoketeApiWrapper Ruby Gem #{BoketeApiWrapper::VERSION}".freeze
    end

  end
end
