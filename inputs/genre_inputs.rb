require_relative '../memory/genre_memory'
require_relative '../classes/genre'

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
        show_saved_genres(saved_genres)
        print "#{saved_genres.length}) "
        print "Add new genre\n"
        genre_selected = gets.chomp.to_i
      end

      genre_selected = if genre_selected == saved_genres.length
                         new_genre
                       else
                         saved_genres[genre_selected]
                       end
    end
    genre_selected
  end

  def show_saved_genres(data)
    puts "\nSelect an option from the list [GENRE]: "
    data.each do |genre|
      print "#{data.find_index(genre)}) "
      print "#{genre.name}\n"
    end
  end

  def new_genre
    print "Please enter genre (e.g 'Suspense', 'Comedy'): "
    name = gets.chomp
    genre_selected = Genre.new(name)
    add_genre(genre_selected)
    genre_selected
  end
end
