require_relative "ethical_activewear.rb"

class Scraper

   def get_page
      Nokogiri::HTML(open("https://goodonyou.eco/ultimate-guide-ethical-activewear/"))
   end
  
  
   def scrape_page
    get_page.css("div.article__block .layout-block").each do |brand|
      Brand.new.create_from_page(brand)
    end
  end



end

