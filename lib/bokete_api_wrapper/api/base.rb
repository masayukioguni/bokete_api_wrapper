require 'rest-client'
require 'nokogiri'

module BoketeApiWrapper
  module Api
    class Base
      def self.provider(provider_name)
        define_method(:client) do
          BoketeApiWrapper::Clients.send(provider_name)
        end
      end
    end
    class UnknownServiceError < StandardError ; end
  end
end
