require_relative "ethical_activewear.rb"

class EthicalActivewear::CLI
  
 def call 
   puts "Welcome to your shop of ethically made activewear!"
   puts "These are the top ethically-made activewear brands of 2020"
   puts "Which brand would you like to learn more about?"
   puts ""
   puts "Enter a number or exit"
   
   EthicalActivewear::Scraper.new.scrape_page
   
   start

 end
 
 def start 
   "Enter a number or exit."
   list_brands
   user_input = gets.strip
   if user_input == 'exit'
     puts "Thanks!"
     exit 
   elsif user_input.to_i.between?(1,17)
     index = input_to_index(user_input)
     print_brand(index)
     start
   else 
     puts "Sorry, don't understand"
     start
    end
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
   puts ""
   puts brand.name
   puts brand.rating 
   puts "" 
   puts "Description:"
   puts brand.description 
   puts ""
   puts brand.shipping 
   puts "Shop: #{brand.url}"
   puts ""
 end
 
 
  
end