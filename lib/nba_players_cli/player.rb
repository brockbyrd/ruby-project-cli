require 'pry'

class Player

  attr_accessor :first_name, :last_name, :height_feet, :height_inches, :weight_pounds, :position, :id, :player

  @@all = []

  def initialize(attr_hash)
    attr_hash.each do |k, v|
      self.send("#{k}=", v) #if self.respond_to?("#{k}=")
    end
    @players = []
    @@all << self
  end

  def self.find_by_name(last_name)
    self.all.select {|player| player.last_name == last_name}
    # binding.pry
  end

  def self.all
    @@all
  end
end
