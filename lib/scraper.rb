require 'nokogiri'
require 'open-uri'
require 'pry'
class Scraper
  
def get_page
  doc = Nokogiri::HTML(open("http://store.nike.com/us/en_us/pw/mens-nikeid-lifestyle-shoes/1k9Z7puZoneZoi3"))
end

def get_names
item_container.css(".product-name").css('p').children.map {|name| name.text}.compact
end  

def get_prices
  item_container.css(".product-pricer").css("p").children.map {|price| price.text}.compact
  binding.pry
end

def item_container
  doc.css(".grid-item-info")
end

scraper = Scraper.new
names = scraper.get_names
prices = scraper.get_prices

(0...prices.size).each do |index|
  puts "--- index: #{index +1} ---"
  puts "Name: #{names[index]} | price: #{prices[index]}"
end
end
