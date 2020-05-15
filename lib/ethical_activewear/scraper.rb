require_relative "ethical_activewear.rb"

class EthicalActivewear::Scraper

   def get_page
      Nokogiri::HTML(open("https://goodonyou.eco/ultimate-guide-ethical-activewear/"))
   end
  

   def scrape_page
     get_page.css("div.article__block .layout-block").each do |brand|
       attribute_hash = {}
       attribute_hash[:name] = brand.css("h2.layout-block__heading").text
       attribute_hash[:url] = brand.css("h2.layout-block__heading a").attribute("href").value
       attribute_hash[:description] = brand.css("div.layout-block__main div.layout-block__content.rich-text").text
       attribute_hash[:shipping] = brand.css("div.layout-block__main div.layout-block__content figure.layout-block__image-container").text
       attribute_hash[:rating] = brand.css("div.layout-block__aside div.meta-labels").text
       EthicalActivewear::Brand.create(attribute_hash)
    end
  end



end
