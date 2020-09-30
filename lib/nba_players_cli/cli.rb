require 'pry'

class NbaPlayersCli::CLI
  def call
    #Greeting the user
     puts "Welcome to the NBA player CLI!"
     greeting
     @last_name = gets.strip.capitalize

     API.get_players(@last_name)
     API.get_player(@player)
     print_players
     player_menu
     input = gets.strip.capitalize

     if input.to_i > 0 && input.to_i <= Player.find_by_name(@last_name).length
       print_player(player)
     elsif input == "New Name"
       greeting
       @last_name = gets.strip.capitalize
       print_players
     end
 end

  def player_menu
    puts ""
    puts "Enter the number of the player you want to know more about, type in 'new name' for new players, or type 'exit' to exit: "
    puts ""
  end

  def print_players
    Player.find_by_name(@last_name).each.with_index(1) do |p, i|
      puts "#{i}. #{p.first_name} #{p.last_name.capitalize}"
    end
  end

  def print_player(player)
    puts "Name: #{player.first_name} " + "#{player.last_name}"
    puts "Height: #{player.height_feet}' " + "#{player.height_inches}"
    puts "Weight: #{player.weight_pounds}"
    puts "Position: #{player.position}"
  end

  def greeting
    puts "What NBA player would you like to know about?"
    puts "Enter a last name: "
  end

  def no_info
    puts "No information found, try again"
  end
end
