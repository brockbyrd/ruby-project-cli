class API

  def self.get_data
    response = HTTParty.get("https://www.balldontlie.io/api/v1/players")
    players_array = JSON.parse(response.body)["data"]
    players_array.each do |player|
      Player.new(player)
    end
  end

end
