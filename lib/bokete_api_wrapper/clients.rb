require 'bokete_api_wrapper/clients/bokete_api'

module BoketeApiWrapper
  module Clients
    def self.bokete
      @video ||= BoketeApiWrapper::Clients::BoketeApi.new
    end
  end
end
