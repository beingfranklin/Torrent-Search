#YTS Torrent search 


require 'rubygems'
require 'net/http'
require 'json'
puts "Movie You want to search for?"
user_movie_name= gets.chomp
movie_name =user_movie_name.downcase.tr(" ", "-")
url = "https://yts.am/api/v2/list_movies.json?query_term="+ movie_name + '"'
uri = URI(url)
response = Net::HTTP.get(uri)
parsed = JSON.parse(response)
query_response_status = parsed["status"]

#If Search  Successful and return status
if query_response_status=="ok"  

    puts
    puts
    movie_cnt=0
    movie_cnt = parsed["data"]["movie_count"]
    p movie_cnt
    puts
    puts

    #p parsed["data"]["movies"]#["title"]
    movies_array= parsed["data"]["movies"]
        
    if  movie_cnt>0
        parsed["data"]["movies"].each do |movies|   
           puts movies["title"]    
        end
    elsif movie_cnt==0
        puts "Sorry !! No Movies found with  '#{user_movie_name}' as name.. "
    end
    puts
    puts

elsif query_response_status=="error"
    puts "Error!! Your Search query could not be processed"
else 
    puts "Unknown Error. Please report this"
end











