require 'rest-client'

module BoketeApiWrapper
  module Clients
    class BoketeApi
      def initialize
        @scheme = 'http'
        @host = BoketeApiWrapper.configuration.host
        @endpoint = BoketeApiWrapper.configuration.endpoint
        @ua = BoketeApiWrapper.configuration.user_agent
      end

      def get(path, params = {}, &block)
        RestClient.get build_url(path), {:params => params, :user_agent => @ua}, &block
      end

      def post(path, args = {}, options = {})
        RestClient.post build_url(path), args, options.merge(:user_agent => @ua)
      end

      private
      def build_url(path)
        URI.join("#{@scheme}://#{@host}/#{@endpoint}/", path).to_s
      end
    end
  end
end

