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

      def parse(response)
        doc = Nokogiri::HTML(response)
        doc.xpath('//div/input').map{|a|
          a['value']
        }.reject{|a|
          a.include?('href')
        }.select{|a|
          a.include?('ss.bokete')
        }.uniq
      end
    end
    class UnknownServiceError < StandardError ; end
  end
end
