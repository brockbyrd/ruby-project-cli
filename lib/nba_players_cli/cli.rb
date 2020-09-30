require 'pry'

class NbaPlayersCli::CLI
  def call
    #Greeting the user
     puts "Welcome to the NBA player CLI!"
     puts "What NBA player would you like to know about?"
     puts "Enter a last name: "
     @last_name = gets.strip.capitalize

     API.get_players(@last_name)
     print_players
     player_menu
     input = gets.strip

     while input != 'exit' do
       #go back to "main menu"
       if input == 'New Players'

         puts ""
         puts "What NBA player would you like to know about?"
         puts "Enter a last name: "
         puts ""
         @last_name = gets.strip.capitalize
         print_player(player)

       elsif Player.find_by_name(@last_name).length == 0
         no_info
         player_menu

       elsif input.to_i > 0 && input.to_i <= Player.find_by_name(@last_name).length

         player = Player.find_by_name(@last_name)[input.to_i-1]
         API.get_player(player) if !player.first_name
         print_player(player)
         player_menu
       else
         puts "No player found, try again"
         player_menu
       end

       input = gets.strip
     end

     puts ""
     puts "Thank you for using the NBA player app!"
  end

  def player_menu
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
    puts "Name: #{player.first_name} " + "#{player.last_name}"
    puts "Height: #{player.height_feet} " + "#{player.height_inches}"
    puts "Weight: #{player.weight_pounds}"
    puts "Position: #{player.position}"
  end

  def no_info
    puts "No information found, try again"
  end
end
