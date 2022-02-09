require_relative '../memory/genre_memory.rb'
require_relative '../classes/genre.rb'

module GenreInputs
    include GenreMemory


    def check_genres
        saved_genres = show_genres
        genre_selected = nil
    
        if saved_genres.empty?
            genre_selected = new_genre
        else
    
        genre_selected = saved_genres.length + 1
          while genre_selected > saved_genres.length
            puts "\nSelect an option from the list [GENRE]: "
            saved_genres.each do |genre|
              print "#{saved_genres.find_index(genre)}) "
              print "#{genre.name}\n"
            end
            print "#{saved_genres.length}) "
            print "Add new genre\n"
            genre_selected = gets.chomp.to_i
          end
    
          if genre_selected == saved_genres.length
            genre_selected = new_genre
          else
            genre_selected = saved_genres[genre_selected]
          end
        end
        genre_selected
      end
    
    
        def new_genre 
            
            print "Please enter genre (e.g 'Suspense', 'Comedy'): "
        name = gets.chomp
          genre_selected = Genre.new(name)
          add_genre(genre_selected)
          genre_selected
    
        end
end
  