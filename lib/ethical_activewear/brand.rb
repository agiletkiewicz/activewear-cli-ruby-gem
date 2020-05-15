require_relative "ethical_activewear.rb"

class EthicalActivewear::Brand 
  
  attr_accessor :name, :url, :rating
  attr_reader :description, :shipping
  @@all = []
  

  
  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
  end
  
  
  def self.create(attributes)
    new_brand = self.new(attributes) 
    new_brand.save
  end
  
  
  def save
    @@all << self
  end
  
  
  def self.all 
    @@all
  end
  
  
  def description=(string)
    formatting_array = string.split(/(See the rating)/)
    #description comes out with 'see the rating' and 'shop' at the end
    @description = formatting_array[0].strip
  end
  
  
  def shipping=(string)
    formatting_array = string.split("–")
    #shipping information comes after description of product pictured
    @shipping = formatting_array[1].strip
  end
  
  
  
end