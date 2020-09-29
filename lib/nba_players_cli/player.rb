require 'pry'

class Player

  attr_accessor :name, :team, :height, :weight, :position

  @@all = []

  def inintialize(attr_hash)
    attr_hash.each do |k, v|
      self.send("#{k}=", v) if self.respond_to?("#{k}=")
    end
  end

  def save
    @@all << self
  end
end
