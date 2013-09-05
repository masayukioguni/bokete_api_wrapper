require File.expand_path('../version', __FILE__)


module BoketeApiWrapper
  class Configuration
    attr_accessor :dev ,:endpoint, :user_agent
    def dev? ; @dev ||= false ; end
  end
end
