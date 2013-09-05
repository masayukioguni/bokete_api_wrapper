require "bokete_api_wrapper/version"
require "bokete_api_wrapper/configuration"

module BoketeApiWrapper
    def self.configuration
    @config ||= BoketeApiWrapper::Configuration.new
  end

  def self.setup
    yield configuration if block_given?
  end
end
