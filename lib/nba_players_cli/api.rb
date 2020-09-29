class API

  def self.get_data
    response = RestClient.get("https://www.balldontlie.io/api/v1/players?search=#{last_name}")
    players_array = JSON.parse(response.body)["data"]
    players_array.each do |player|
      Player.new(player)
    end
  end

end
