require 'pry'

class API

   def self.get_players(last_name)
     response = RestClient.get("https://www.balldontlie.io/api/v1/players?search=#{last_name}")
     players_array = JSON.parse(response.body)
     #binding.pry
     players_array["data"].collect do |p|
       Player.new(first_name: p["first_name"], last_name: p["last_name"], height_feet: p["height_feet"], weight_pounds: p["weight_pounds"], position: p["position"]) if p["first_name"] != nil && p["last_name"] != nil
     end
   end
 end
