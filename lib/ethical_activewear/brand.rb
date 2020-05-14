require_relative "ethical_activewear.rb"

class EthicalActivewear::Brand 
  
  attr_reader :name, :url, :description, :rating, :shipping
  @@all = []
  
  
  
  def create_from_page(brand_object)
    @name = brand_object.css("h2.layout-block__heading").text
    @url = brand_object.css("h2.layout-block__heading a").attribute("href").value
    @description = brand_object.css("div.layout-block__main div.layout-block__content.rich-text").text
    @rating = brand_object.css("div.layout-block__aside div.meta-labels").text
    @shipping = brand_object.css("div.layout-block__main div.layout-block__content figure.layout-block__image-container").text
    save
  end
  
  def save
    @@all << self
  end
  
  def self.all 
    @@all
  end
  
  
  
end