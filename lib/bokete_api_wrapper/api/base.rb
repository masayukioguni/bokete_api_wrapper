require 'rest-client'
require 'nokogiri'

module BoketeApiWrapper
  module Api
    class Base
      def self.provider(provider_name)
        p "xxxx #{provider_name} xxxx"
          
        define_method(:client) do

          p "xxxx #{provider_name} xxxx"
          #Niconico::Clients.send(provider_name)
        end
      end
    end
    class UnknownServiceError < StandardError ; end
  end
end
