require_relative "ethical_activewear.rb"

class EthicalActivewear::CLI
  
 def call 
   puts "Welcome to your shop of ethically made activewear!"
   puts "These are the top ethically-made activewear brands of 2020"
   puts "Which number brand would you like to learn more about?"
   puts ""
   
   EthicalActivewear::Scraper.new.scrape_page
   
   EthicalActivewear::Brand.all.each.with_index(1) do |brand, index|
     puts "#{index}. #{brand.name}"
   end

  # list brands
  # get user input 
  
 end
 
 
  
end