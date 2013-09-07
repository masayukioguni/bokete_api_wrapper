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

      #{:boke=>"ケートの結果、抱き枕にしたいのは絶",
      # :img=>"http://ss.bokete.jp/11145224.jpg",
      # :href=>"http://bokete.jp/boke/11145224"}
      def parse(response)
        doc = Nokogiri::HTML(response)
        doc.xpath('//div/input').map{|a|
          a['value']
        }.select{|a|
          a.include?('ss.bokete') && a.include?('title')
        }.map{|a|
          node  = Nokogiri::HTML(a)
          href_node = node.xpath('//a')
          img_node = href_node.xpath('//img')

          res = {:boke => img_node[0]['title'],
            :img => img_node[0]['src'],
            :href => href_node[0]['href']
          }
        }.uniq
      end

      def parse_user(response)
        doc = Nokogiri::HTML(response)
        doc.xpath('//div[@class="boke-list ui-widget ui-helper-clearfix ui-corner-all "]').map{|a|
          href_node = a.at('a')
          id = href_node['href'].gsub("\/boke\/", '')
          title_node = a.at('h3')
          img = "http://ss.bokete.jp/#{id}.jpg"
          href = "http://bokete.jp/boke/#{id}"
          boke = title_node.text

          res = {:boke => boke,
            :img => img,
            :href => href
          }
          p res
        }
      end
    end
    class UnknownServiceError < StandardError ; end
  end
end
