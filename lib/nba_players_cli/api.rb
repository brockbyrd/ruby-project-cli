require 'pry'

class API

   def self.get_players(last_name)
     url=("https://www.balldontlie.io/api/v1/players?search=#{last_name}")
     uri=URI(url)
     response=Net::HTTP.get(uri)

     players=JSON.parse(response)["data"].each do |p|
       Player.new(first_name: p["first_name"], last_name: last_name, position: p["position"], height_feet: p["height_feet"], height_inches: p["height_inches"], weight_pounds: p["weight_pounds"], id: p["id"]) if p["first_name"] != nil && p["last_name"] != nil
     end
   end
 end
