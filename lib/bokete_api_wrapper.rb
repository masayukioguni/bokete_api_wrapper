require "bokete_api_wrapper/version"
require "bokete_api_wrapper/configuration"
require "bokete_api_wrapper/clients"
require "bokete_api_wrapper/api"

module BoketeApiWrapper
    def self.configuration
    @config ||= BoketeApiWrapper::Configuration.new
  end

  def self.setup
    yield configuration if block_given?
  end
end
