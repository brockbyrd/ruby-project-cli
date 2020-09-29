require 'pry'

class API

   def self.get_players(last_name)
     response = RestClient.get("https://www.balldontlie.io/api/v1/players/?search#{last_name}")
     players_array = JSON.parse(response.body)
     # binding.pry
     players_array["data"].each do |p|
       Player.new(first_name: p["first_name"], last_name: last_name)
     end
   end

#   def self.get_data(name)
#     url="https://www.balldontlie.io/api/v1/players?search=#{name}"
#     uri=URI(url)
#     response=Net::HTTP.get(uri)
#
#     players=JSON.parse(response)["data"].each do |p|
#       Player.new(first_name: p["first_name"], last_name: p["last_name"], position: p["position"], weight_pounds: p["weight_pounds"], height_feet: ["height_feet"], height_inches: ["height_inches"])
#     end
#   end
end

# position: p["position"], weight_pounds: p["weight_pounds"], height_feet: ["height_feet"], height_inches: ["height_inches"]
