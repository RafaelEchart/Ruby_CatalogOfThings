require_relative '../memory/album_memory'

class ShowAlbums
  include AlbumsMemory

  def initialize
    @albums = show_albums
  end

  def show
    puts ''
    if @albums.length.positive?
      selected_album = @albums.length + 1
      while selected_album > @albums.length
        @albums.each do |album|
          puts "#{@albums.find_index(album)}) Title: #{album.name}, Author: #{album.author.first_name}, On Spotify: #{album.on_spotify ? "Yes" : "No"}"
        end
        puts ""
        puts "#{@albums.length}) EXIT TO MENU"
        puts 'Please select a album for more information'
        selected_album = gets.chomp.to_i
      end

      if selected_album < @albums.length
        puts "Title: #{@albums[selected_album].name}"        
        puts "Author: #{@albums[selected_album].author.first_name} #{@albums[selected_album].author.last_name}"        
        puts "Genre: #{@albums[selected_album].genre.name}"        
        puts "On Spotify?: #{@albums[selected_album].on_spotify ? "Yes" : "No"}"        
        puts "Published Date: #{@albums[selected_album].publish_date}"        
        puts "Label: #{@albums[selected_album].label.title}"     
        #Press any key to continue   
      end
    else
      puts 'Empty Library, add a album first'

    end
  end
end
