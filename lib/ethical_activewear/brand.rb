require_relative "ethical_activewear.rb"

class EthicalActivewear::Brand 
  
  attr_accessor :name, :url, :description, :rating, :shipping
  @@all = []
  

  
  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
  end
  
  def self.create(attributes)
    new_brand = self.new(attributes) 
    @@all << new_brand
  end
  
  def save
    @@all << self
  end
  
  def self.all 
    @@all
  end
  
  
  
end