require 'pry'

class NbaPlayersCli::CLI
  def call
    #Greeting the user
     puts "Welcome to the NBA player CLI!"
     greeting
     @last_name = gets.strip.capitalize
     API.get_players(@last_name)
     print_players
     player_menu
     input = gets.strip.downcase
     while input != 'exit'
       if input == 'new'
         greeting
         @last_name = gets.strip.downcase
         API.get_players(@last_name) if Player.find_by_name(@last_name).length == 0
         print_players
       elsif input.to_i > 0 && input.to_i <= Player.find_by_name(@last_name).length
         player = Player.find_by_name(@last_name)[input.to_i-1]
         API.get_player(player) if !player.id
         print_player(player)
       else
         puts "No information found, please try again"
       end
       player_menu
       input = gets.strip.downcase
     end
     puts "Thank you for using the NBA CLI!"
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
    puts "No information found, please try again"
  end
end
