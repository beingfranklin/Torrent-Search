#YTS Torrent search 

require 'rubygems'
require 'net/http'
require 'json'
require 'rainbow'
require 'terminal-table'	

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
            rows = []
            count=0
            parsed["data"]["movies"].each do |movies|  
                title=movies["title_long"]
                count+=1
                puts Rainbow("##{count} - #{title}").bg(:white).black
               
                movies["torrents"].each do |torrents|
                    peers=torrents["peers"].to_i
                    seeds=torrents["seeds"].to_i
                     
                    
                    puts "Quality: "+ torrents["quality"]+" Size :"+ torrents["size"]  + Rainbow(" Seeders :#{seeds}").green  + Rainbow(" Peers : #{peers} ").red + Rainbow("  Torrent : #{torrents["url"]}").yellow #.bg(:yellow)
                   

                    #rows << [movies["title_long"],torrents["quality"],torrents["size"],Rainbow(" Seeders :#{seeds}").blue,Rainbow(" Peers : #{peers} ").red,Rainbow("  Torrent : #{torrents["url"]}").yellow]
                    
                   # table = Terminal::Table.new :rows => rows
                    #puts table

               end

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











