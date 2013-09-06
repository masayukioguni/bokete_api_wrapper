require 'bokete_api_wrapper/clients/bokete_api'

module BoketeApiWrapper
  module Clients
    def self.popular
      @popular ||= BoketeApiWrapper::Clients::BoketeApi.new
    end
    def self.hot
      @hot ||= BoketeApiWrapper::Clients::BoketeApi.new
    end    
  end
end
