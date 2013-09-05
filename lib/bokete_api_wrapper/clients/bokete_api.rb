require 'rest-client'

module BoketeApiWrapper
  module Clients
    class BoketeApi
      def initialize
        @host = BoketeApiWrapper.configuration.endpoint
        @scheme = 'http'
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
        URI.join("#{@scheme}://#{@host}", path).to_s
      end
    end
  end
end

