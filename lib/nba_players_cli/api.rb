require 'pry'

class API

   def self.get_players(name)
     url=("https://www.balldontlie.io/api/v1/players?search=#{name}")
     uri=URI(url)
     response=Net::HTTP.get(uri)
     # binding.pry
     players=JSON.parse(response)["data"]
     players.each do |p|
       # binding.pry
       Player.new(first_name: p["first_name"], last_name: p["last_name"], position: p["position"], height_feet: p["height_feet"], height_inches: p["height_inches"], weight_pounds: p["weight_pounds"], id: p["id"], team: p["team"].access("full_name.")) if p["first_name"] != nil && p["last_name"] != nil
     end
   end
 end
