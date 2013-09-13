module BoketeApiWrapper
  module Api
    class Popular < Base
      provider :bokete_api

      class ApiError < StandardError ; end

      def get(page = 1,options = {})
        params = {
          :page => page
        }
        response = client.get 'boke/popular', params
        raise Error, "status code #{response.code}" unless response.code.to_i == 200
        parse response
      end
    end
  end
end
