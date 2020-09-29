require 'pry'

class NbaPlayersCli::CLI

  def call
     puts "Welcome to the NBA player CLI!"
     puts "What NBA player would you like to know about?"
     puts "Enter a last name: "
     @last_name = gets.strip.capitalize
     API.get_players(@last_name)
     print_players
     input = gets.strip.capitalize
  end

  def list_player

    puts ""
    puts ""
    puts "Enter the number of the player you want to know more about, type in another name or type 'exit' to exit: "
    puts ""
    input = gets.split.map(&:capitalize).join(' ')

    player_selection(input)
  end

  def player_selection(player)
    p = Player.find_by_name(player)
    binding.pry
  end

  def print_players
    Player.all.each.with_index(1) do |p, i|
      puts "#{i}. #{p.first_name} #{p.last_name.capitalize}"
    end
  end

  def valid?
    puts "No player found, try again"
    call
  end

end
