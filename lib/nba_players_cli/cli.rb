class NbaPlayersCli::CLI

  def call
     puts "Welcome to the NBA player CLI!"
     puts "What NBA player would you like to know about?"
     puts "Enter a last name: "
     @last_name = gets.strip.capitalize
     API.get_players(@last_name)
     list_player
  end

  def list_player
    Player.all.each.with_index(1) do |p, i|
      puts "#{i}. #{p.first_name} #{p.last_name.capitalize}"
    end
    puts ""
    puts ""
    puts "Which player would you like to know more about"
    input = gets.strip.capitalize

    player_selection(input)
  end

  def player_selection(player)
    p = Player.find_by_name(player)
  end

  def valid?
    puts "No player found, try again"
    call
  end

end
