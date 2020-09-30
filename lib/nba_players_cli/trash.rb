# while input != 'exit' do
#   #go back to "main menu"
#   if input == 'new name'
#
#     puts ""
#     puts "What NBA player would you like to know about?"
#     puts "Enter a last name or type 'exit' to exit: "
#     puts ""
#     API.get_players(@last_name) if Player.find_by_name(@last_name) == 0
#     @last_name = gets.strip.capitalize
#     print_players
#     player_menu
#   else
#     puts "No player found, try again"
#     player_menu
#   end
#   binding.pry
#   input = gets.strip
# end
#
# puts ""
# puts "Thank you for using the NBA player app!"
# end
#
# elsif input.to_i > 0 && input.to_i <= Player.find_by_name(@last_name).length
#
#   player = Player.find_by_name(@last_name)[input.to_i-1]
#   API.get_players(player) if !player.first_name
#  print_player(player)
#   player_menu
