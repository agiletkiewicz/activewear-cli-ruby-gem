require_relative "ethical_activewear.rb"

class EthicalActivewear::CLI
  
 def call 
   puts "Welcome to your shop of ethically made activewear!"
   puts "These are the top ethically-made activewear brands of 2020"
   puts "Which number brand would you like to learn more about?"
   puts ""
   EthicalActivewear::Scraper.new.scrape_page
   EthicalActivewear::Brand.all
  # Scraper class scrapes website 
  # Brand objects created
  # list brands
  # get user input 
  
 end
  
end