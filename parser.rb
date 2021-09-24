require 'open-uri'
require 'nokogiri'

url = 'https://ria.ru'
html = URI.open(url)
doc = Nokogiri::HTML(html)

puts 'Главное:'
(1..5).each do |i|
  puts "    - #{doc.xpath("//*[@id=\"content\"]/div[2]/div[1]/div[1]/div[1]/div[5]/div/div/div/div/div[2]/div[#{i}]/a").first['title']}"
end

puts "\nПопулярное:"
(1..5).each do |i|
  puts "    - #{doc.xpath("//*[@id=\"content\"]/div[2]/div[1]/div[1]/div[2]/div[1]/div/div/div/div/div[2]/div[#{i}]/a").first['title']}"
end
