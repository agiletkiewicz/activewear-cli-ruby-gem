require 'open-uri'
require 'nokogiri'
require 'pry'


  def get_page
    Nokogiri::HTML(open("https://goodonyou.eco/ultimate-guide-ethical-activewear/"))
  end


