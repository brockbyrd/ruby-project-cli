class NbaPlayersCli::CLI

  def call
     puts "Welcome to the NBA player CLI!"
     puts "What NBA player would you like to know about?"
     puts "Enter a last name: "
     API.get_data
     menu
  end

  def menu
    input = gets.strip.downcase

    if input == 'player name'
      list_player
    elsif input == 'exit'
      puts 'exit'
    else
      valid?
    end
  end

  def list_player
    Player.all.each.with_index(1) do |n, i|
      puts "#{i}. #{n.first_name} #{n.last_name}"
    end
    puts ""
    puts ""
    puts "Which player would you like to know more about"
    input = gets.strip.downcase

    player_selection(input)
  end

  def player_selection(player)
    puts "#{player}"
    #Player.all.find do |player|
    #end
  end

  def list_team
    puts 'team player is on'
  end

  def list_attributes #height, weight, position
    puts 'player attributes'
  end

  def list_position
    puts 'position'
  end

  def valid?
    puts "No player found, try again"
    menu
  end

end
