require_relative "ethical_activewear.rb"

class EthicalActivewear::CLI
  
 def call 
   puts ""
   puts "Welcome to your shop of ethically made activewear!".yellow
   puts "These are the top ethically-made activewear brands of 2020, according to Good On You:"
   puts ""
   
   EthicalActivewear::Scraper.new.scrape_page
   list_brands 
   
   puts "" 
   puts "Enter the number of a brand to learn more!".yellow
   
   start

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
   formatted_description = brand.description.split(/(See the rating)/)
   formatted_shipping = brand.shipping.split("–")
   puts ""
   puts "----------------------Brand:---------------------".light_blue
   puts "Name: #{brand.name}"
   puts brand.rating
   puts "" 
   puts "------------------Description:------------------".light_blue
   puts formatted_description[0] 
   puts ""
   puts "----------------------Shop:----------------------".light_blue
   puts formatted_shipping[1].strip
   puts "Website: #{brand.url}"
   puts ""
 end
 
 
  def start 
   user_input = gets.strip
   if user_input.downcase == 'exit'
     puts "See you next time!".yellow
     exit 
   elsif user_input.to_i.between?(1,17)
     index = input_to_index(user_input)
     print_brand(index)
     puts "Enter another number, 'list' to see the list again, or 'exit'".yellow
     start
  elsif user_input.downcase == 'list'
     list_brands
     puts "" 
     puts "Enter the number of a brand to learn more! Or exit.".yellow
     start
   else 
     puts "Sorry, I don't understand.".red 
     puts "Enter the number of a brand, 'list' to see the list again, or exit.".yellow
     start
    end
 end
 
 
  
end