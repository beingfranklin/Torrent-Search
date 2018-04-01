
require 'rubygems'
require 'net/http'
require 'json'
movie_name ='HellBoy'
url = "https://yts.am/api/v2/list_movies.json?query_term="+ movie_name + '"'
uri = URI(url)
response = Net::HTTP.get(uri)
parsed = JSON.parse(response)
#puts parsed
p parsed["status"]
puts
puts
movie_cnt=0
p parsed["data"]["movies"]#["0"]["title"]
    
puts
puts

#If Search  Successful

