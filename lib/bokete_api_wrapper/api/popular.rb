module BoketeApiWrapper
  module Api
    class Popular < Base
      provider :popular
      
      class ApiError < StandardError ; end

      def get(page = 0,options = {})
        params = {
          page: page
        }
        response = client.get '/popular', params
        doc = Nokogiri::HTML(response)
        raise Error, "status code #{response.code}" unless response.code.to_i == 200
   
        doc.xpath('//div/input').map{|a|
          a['value']
        }.reject{|a|
          a.include?('href')
        }.select{|a|
          a.include?('ss.bokete')
        }.uniq


        #raise exception_mapping(xml.css("code").text) unless xml.xpath("//@status").text == "ok"
      end

      private
      def exception_mapping(code)
        case code
        when "INVALIDVIDEO", "PARAMERROR", "EXIST"
          RestClient::BadRequest
        when "NONEXIST"
          RestClient::ResourceNotFound
        when "INTERNALERROR"
          RestClient::InternalServerError
        when "MAINTENANCE"
          RestClient::ServiceUnavailable
        end
      end
    end
  end
end
