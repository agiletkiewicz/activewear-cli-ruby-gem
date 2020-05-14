require_relative "ethical_activewear.rb"

class EthicalActivewear::CLI
  
 def call 
   puts "Welcome to your shop of ethically made activewear!"
   puts "These are the top ethically-made activewear brands of 2020"
   puts "Which number brand would you like to learn more about?"
   puts ""
   
   EthicalActivewear::Scraper.new.scrape_page
   
   list_brands
  
  index = input_to_index(gets)
  
  print_brand(index)
  
  # print brand detail
  # present new option
  
 end
 
 def list_brands
   EthicalActivewear::Brand.all.each.with_index(1) do |brand, index|
       puts "#{index}. #{brand.name}"
   end
 end
 
 def input_to_index(input)
   index = input.to_i - 1 
   index
 end
 
 def print_brand(index)
   brand = EthicalActivewear::Brand.all[index]
   puts brand.name
 end
 
  
end