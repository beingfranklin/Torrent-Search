
require 'rubygems'
require 'net/http'
require 'json'
puts "Movie You want to search for?"
movie_name =gets.chomp
url = "https://yts.am/api/v2/list_movies.json?query_term="+ movie_name + '"'
uri = URI(url)
response = Net::HTTP.get(uri)
parsed = JSON.parse(response)
#puts parsed
p parsed["status"]
puts
puts
movie_cnt=0
movie_cnt = parsed["data"]["movie_count"]
p movie_cnt
puts
puts
#p parsed["data"]["movies"]#["title"]
movies_array= parsed["data"]["movies"]

movies_array.each do |key, value|  
    puts "The hash key is #{key} and the value is #{value}."
    if (key =="id")
        puts value
    end
end 
puts
puts

#If Search  Successful

