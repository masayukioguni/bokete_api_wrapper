module BoketeApiWrapper
  module Api
    class User < Base
      provider :user

      class ApiError < StandardError ; end

      def get(username = "", page = 1,options = {})
        params = {
          :page => page
        }
        response = client.get "user/#{username}/boke", params
        p response
        raise Error, "status code #{response.code}" unless response.code.to_i == 200
        parse_user response
      end
    end
  end
end