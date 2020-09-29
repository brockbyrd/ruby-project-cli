require 'pry'

class Player

  attr_accessor :name, :team, :height, :weight, :position

  @@all = []

  def inintialize(attr_hash)
    attr_hash.each do |k, v|
      self.send("#{k}=", v) if self.respond_to?("#{k}=")
    end
  end

  def self.find_by_name(name)
    self.all.collect do |player|
      player.name == name
    end
  end

  def save
    @@all << self
  end
end
