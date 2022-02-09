# rubocop:disable Style/ClassVars
module GenreMemory
    @@genre = []
  
    def add_genre(new_genre)
      @@genre << new_genre
    end
  
    def show_genres
      @@genre
    end
  end
  # rubocop:enable Style/ClassVars
  