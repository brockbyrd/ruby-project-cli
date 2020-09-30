require 'pry'

class API

   def self.get_players(last_name)
     response = RestClient.get("https://www.balldontlie.io/api/v1/players?search=#{last_name}")
     players_array = JSON.parse(response.body)
     #binding.pry
     players_array["data"].collect do |p|
       Player.new(first_name: p["first_name"], last_name: last_name) if p["first_name"] != nil && p["last_name"] != nil
     end
   end

   def self.get_player(player)
     url="https://www.balldontlie.io/api/v1/players?search=#{player.player_id}"
     uri = URI(url)
     response = Net::HTTP.get(uri)
     player_info = JSON.parse(response)["data"][0]
     player.height = player_info["height_feet" + "height_inches"]
     player.weight = player_info["weight_pounds"]
     player.position = player_info["position"]
     player.id = player_info["id"]
   end
   binding.pry
 end
