require_relative '../memory/genre_memory'

class ShowGenre
  include GenreMemory

  def initialize
    @genres = show_genres
  end

  def show
    puts ''
    if @genres.length.positive?
      selected_genre = @genres.length + 1
      while selected_genre > @genres.length
        @genres.each do |genre|
          puts "#{@genres.find_index(genre)}) Name: #{genre.name}, Count: #{genre.items.length}"
        end
        puts ''
        puts "#{@genres.length}) EXIT TO MENU"
        puts 'Please select a genre for more information'
        selected_genre = gets.chomp.to_i
      end

      organize_data(selected_genre)
    else
      puts 'Empty Library, add a genre first'

    end
  end

  def organize_data(selected_genre)
    return unless selected_genre < @genres.length

    books = []
    albums = []
    games = []

    @genres[selected_genre].items.each do |item|
      instance_name_class = item.class.to_s
      books.push(item) if instance_name_class == 'Book'
      games.push(item) if instance_name_class == 'Game'
      albums.push(item) if instance_name_class == 'MusicAlbum'
    end

    puts "GENRE: #{@genres[selected_genre].name}, COUNT: #{@genres[selected_genre].items.length} "
    puts '-------------------------------------------------------------'

    show_books(books)
    show_albums(albums)
    show_games(games)

    # Press any key to continue
  end

  def show_books(books)
    return unless books.length.positive?

    puts ''
    puts "               Books [#{books.length}]                     "
    puts ''

    books.each do |book|
      puts "- Title: #{book.name}, Author: #{book.author.first_name}"
    end
    puts '------------------------------------------------------'
  end

  def show_albums(albums)
    return unless albums.length.positive?

    puts ''
    puts "               Albums [#{albums.length}]                   "
    puts ''

    albums.each do |album|
      puts "- Title: #{album.name}, Author: #{album.author.first_name}"
    end
    puts '------------------------------------------------------'
  end

  def show_games(games)
    return unless games.length.positive?

    puts ''
    puts "               Games [#{games.length}]                      "
    puts ''
    games.each do |game|
      puts "- Title: #{game.name}, Author: #{game.author.first_name}"
    end
    puts '------------------------------------------------------'
  end
end
