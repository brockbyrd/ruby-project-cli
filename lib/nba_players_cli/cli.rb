class NbaPlayersCli::CLI

  def call
     puts "Welcome to the NBA player CLI!"
     puts "What NBA player would you like to know about?"
     puts "Enter a first and last name: "
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
    puts 'list player'
    puts 'Type ' + 'team ' + 'to know the team, ' + 'attributes ' + 'to know about their height and weight, or ' + 'position ' + 'to know their position.'
    input = gets.strip.downcase
      if input == 'team'
        list_team
      elsif input == 'attributes'
        list_attributes
      elsif input == 'position'
        list_position
      elsif input == 'exit'
        exit
      else
        valid?
      end
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
