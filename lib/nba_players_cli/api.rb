require 'pry'

class API

   def self.get_players(last_name)
     url=("https://www.balldontlie.io/api/v1/players?search=#{last_name}")
     uri=URI(url)
     response=Net::HTTP.get(uri)

     players=JSON.parse(response)["data"].each do |p|
       Player.new(first_name: p["first_name"], last_name: last_name, id: p["id"]) if p["first_name"] != nil && p["last_name"] != nil
     end
   end

   def self.get_player(player)
     url="https://www.balldontlie.io/api/v1/players/#{player.id}"
     uri = URI(url)
     response = NET::HTTP.get(uri)
     player_info = JSON.parse(response)["data"][0]
     player.position = player_info["position"]
     player.height_feet = player_info["height_feet"]
     player.height_inches = player_info["height_inches"]
     player.weight = player_info["weight_pounds"]
  end
 end
