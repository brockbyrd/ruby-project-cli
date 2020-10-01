require 'pry'

class NbaPlayersCli::CLI
  def call
    #Greeting the user
     puts "Welcome to the NBA player CLI!".red.bold
     greeting
     @name = gets.strip.capitalize
     API.get_players(@name)
     # binding.pry
     print_players
     player_menu
     input = gets.strip.downcase

     while input != 'exit'
       if input == 'new'
         Player.all.clear
         greeting
         @name = gets.strip.downcase
         API.get_players(@name) if Player.find_by_name(@name).length == 0
         # binding.pry
         print_players
       elsif input.to_i > 0 && input.to_i <= Player.find_by_name(@name).length
         player = Player.find_by_name(@name)[input.to_i-1]
         # API.get_player(player) if !player.id
         print_player(player)
       else
         puts "No information found, please try again".red.bold
       end
       player_menu
       input = gets.strip.downcase
     end
     puts "Thank you for using the NBA CLI!"
 end

  def player_menu
    puts ""
    puts "Enter the number of the player you want to know more about, type in 'new' for new players, or type 'exit' to exit: ".bold
    puts ""
  end

  def print_players
    # binding.pry
    Player.find_by_name(@name).each.with_index(1) do |p, i|
      puts "#{i}. #{p.first_name} #{p.last_name.capitalize}".bold
    end
  end

  def print_player(player)
    puts "Name: #{player.first_name} ".red.bold + "#{player.last_name.capitalize}".red.bold
    puts "Height: #{player.height_feet}' ".bold + "#{player.height_inches}\"".bold if player.height_feet != nil
    puts "Weight: #{player.weight_pounds}".red.bold if player.weight_pounds != nil
    puts "Position: #{player.position}".bold if player.position != nil
    puts "Team: #{player.team}".red.bold if player.team != nil
  end

  def greeting
    puts "What NBA player would you like to know about?".bold
    puts "Enter a first or last name: ".red.bold
  end
end
