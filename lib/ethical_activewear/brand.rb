require_relative "ethical_activewear.rb"

class EthicalActivewear::Brand 
  
  attr_accessor :name, :url, :description, :rating, :shipping
  @@all = []
  
  
  
  def self.create_from_page(brand_object)
    new_brand = self.new
    new_brand.name = brand_object.css("h2.layout-block__heading").text
    new_brand.url = brand_object.css("h2.layout-block__heading a").attribute("href").value
    new_brand.description = brand_object.css("div.layout-block__main div.layout-block__content.rich-text").text
    new_brand.rating = brand_object.css("div.layout-block__aside div.meta-labels").text
    new_brand.shipping = brand_object.css("div.layout-block__main div.layout-block__content figure.layout-block__image-container").text
    new_brand.save
  end
  
  def save
    @@all << self
  end
  
  def self.all 
    @@all
  end
  
  
  
end