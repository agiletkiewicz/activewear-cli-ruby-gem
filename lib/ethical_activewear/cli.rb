require_relative "ethical_activewear.rb"

class EthicalActivewear::CLI
  
 def call 
   puts "Welcome to your shop of ethically made activewear!"
   puts "These are the top ethically-made activewear brands of 2020"
   puts ""
   
   EthicalActivewear::Scraper.new.scrape_page
   list_brands 
   
   puts "" 
   puts "Enter the number of a brand to learn more!"
   
   start

 end
 
 def start 
   user_input = gets.strip
   if user_input.downcase == 'exit'
     puts "See you next time!"
     exit 
   elsif user_input.to_i.between?(1,17)
     index = input_to_index(user_input)
     print_brand(index)
     puts "Enter another number, 'list' to see the list again, or 'exit'"
     start
  elsif user_input.downcase == 'list'
     list_brands
     puts "" 
     puts "Enter the number of a brand to learn more! Or exit."
     start
   else 
     puts "Sorry, I don't understand. Enter the number of a brand, 'list' to see the list again, or exit."
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