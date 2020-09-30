require 'pry'

class API

   def self.get_players(last_name)
     response = RestClient.get("https://www.balldontlie.io/api/v1/players?search=#{last_name}")
     players_array = JSON.parse(response.body)
     #binding.pry
     players_array["data"].collect do |p|
       Player.new(first_name: p["first_name"], last_name: last_name, height_feet: p["height_feet"], height_inches: p["height_inches"], weight_pounds: p["weight_pounds"], position: p["position"], id: p["id"]) if p["first_name"] != nil && p["last_name"] != nil
     end
     binding.pry
   end
end
