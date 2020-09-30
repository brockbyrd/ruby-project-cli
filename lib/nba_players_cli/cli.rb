require 'pry'

class NbaPlayersCli::CLI

  def call
     puts "Welcome to the NBA player CLI!"
     puts "What NBA player would you like to know about?"
     puts "Enter a last name: "
     @last_name = gets.strip.capitalize
     API.get_players(@last_name)
     print_players
     player_menu
    input = gets.split.map(&:capitalize).join(' ')

     while input != 'exit' do
       if input == @last_name
         @last_name = gets.strip.capitalize
         API.get_players(@last_name) if Player.find_by_name(@last_name).length == 0
         print_players
       elsif input.to_i > 0 && input.to_i <= Player.find_by_name(@last_name).length
         player = Player.find_by_name(@last_name)[input.to_i-1]
         API.get_player(player) if !player.first_name
         print_player(player)
       else
         puts "No player found, try again"
       end
       input
     end
     puts ""
     puts "Thank you for using the NBA player app!"
  end

  def player_menu
    puts ""
    puts ""
    puts "Enter the number of the player you want to know more about, type in another name or type 'exit' to exit: "
    puts ""
  end

  def print_players
    Player.find_by_name(@last_name).each.with_index(1) do |p, i|
      puts "#{i}. #{p.first_name} #{p.last_name.capitalize}"
    end
  end

  def print_player(player)
    Player.find_by
  end

end
