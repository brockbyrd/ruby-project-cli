require 'pry'

class Player

  attr_accessor :first_name, :last_name, :height_feet, :height_inches, :weight_pounds, :position, :id, :name, :team

  @@all = []

  def initialize(attr_hash)
    # binding.pry
    attr_hash.each do |k, v|
      self.send("#{k}=", v) #if self.respond_to?("#{k}=")
    end
    @@all << self
  end

  def self.find_by_name(name)
    self.all.each {|p| p.name == name}
  end

  def self.all
    @@all
  end
end
