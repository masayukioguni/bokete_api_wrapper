module BoketeApiWrapper
  module Api
    class Legend < Base
      provider :legend

      class ApiError < StandardError ; end

      def get(page = 1,options = {})
        params = {
          :page => page
        }
        response = client.get 'boke/legend', params
        raise Error, "status code #{response.code}" unless response.code.to_i == 200
        parse response
      end
    end
  end
end
