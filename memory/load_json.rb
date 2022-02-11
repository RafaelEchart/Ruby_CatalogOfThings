# Local memory
require_relative './album_memory'
require_relative './author_memory'
require_relative './books_memory'
require_relative './games_memory'
require_relative './genre_memory'
require_relative './label_memory'
# Classes
require_relative '../classes/music_album'
require_relative '../classes/author'
require_relative '../classes/book'
require_relative '../classes/game'
require_relative '../classes/genre'
require_relative '../classes/label'
# rubocop:disable Metrics/ModuleLength
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Style/ClassVars

module LoadData
  include AlbumsMemory
  include AuthorMemory
  include BooksMemory
  include GamesMemory
  include GenreMemory
  include LabelMemory

  @@array_genres = []
  @@array_authors = []
  @@array_labels = []

  def start_process
    create_genres
    create_authors
    create_labels
    create_books
    create_albums
    create_games
  end

  def create_genres
    return unless File.file?('./data/genres.json')

    file = File.read('./data/genres.json')
    data_hash = JSON.parse(file)

    data_hash.each do |data|
      new_genre = Genre.new(data['name'])
      @@array_genres.push({ previous_id: data['previous_id'], new_object: new_genre })
      add_genre(new_genre)
    end
  end

  def create_authors
    return unless File.file?('./data/authors.json')

    file = File.read('./data/authors.json')
    data_hash = JSON.parse(file)

    data_hash.each do |data|
      new_author = Author.new(data['first_name'], data['last_name'])
      @@array_authors.push({ previous_id: data['previous_id'], new_object: new_author })
      add_author(new_author)
    end
  end

  def create_labels
    return unless File.file?('./data/labels.json')

    file = File.read('./data/labels.json')
    data_hash = JSON.parse(file)

    data_hash.each do |data|
      new_label = Label.new(data['title'], data['color'])
      @@array_labels.push({ previous_id: data['previous_id'], new_object: new_label })
      add_label(new_label)
    end
  end

  def create_books
    return unless File.file?('./data/books.json')

    file = File.read('./data/books.json')
    data_hash = JSON.parse(file)

    data_hash.each do |data|
      matched_genre, matched_author, matched_label = ''

      @@array_genres.each do |genre|
        matched_genre = genre[:new_object] if genre[:previous_id] == data['genre']
      end

      @@array_authors.each do |author|
        matched_author = author[:new_object] if author[:previous_id] == data['author']
      end

      @@array_labels.each do |label|
        matched_label = label[:new_object] if label[:previous_id] == data['label']
      end

      new_book = Book.new(data['name'], data['publisher'], data['cover_state'], data['publish_date'], matched_genre,
                          matched_author, matched_label)

      save_books(new_book, matched_author, matched_genre, matched_label)
    end
  end

  def save_books(new_book, matched_author, matched_genre, matched_label)
    add_books(new_book)
    matched_label.add_item(new_book)
    matched_genre.add_item(new_book)
    matched_author.add_item(new_book)
  end

  def create_albums
    return unless File.file?('./data/albums.json')

    file = File.read('./data/albums.json')
    data_hash = JSON.parse(file)

    data_hash.each do |data|
      matched_genre, matched_author, matched_label = ''

      @@array_genres.each do |genre|
        matched_genre = genre[:new_object] if genre[:previous_id] == data['genre']
      end

      @@array_authors.each do |author|
        matched_author = author[:new_object] if author[:previous_id] == data['author']
      end

      @@array_labels.each do |label|
        matched_label = label[:new_object] if label[:previous_id] == data['label']
      end

      new_album = MusicAlbum.new(data['name'], data['publish_date'], matched_genre,
                                 matched_author, matched_label, on_spotify: data['on_spotify'])

      save_albums(new_album, matched_author, matched_genre, matched_label)
    end
  end

  def save_albums(new_album, matched_author, matched_genre, matched_label)
    add_albums(new_album)
    matched_label.add_item(new_album)
    matched_genre.add_item(new_album)
    matched_author.add_item(new_album)
  end

  def create_games
    return unless File.file?('./data/games.json')

    file = File.read('./data/games.json')
    data_hash = JSON.parse(file)

    data_hash.each do |data|
      matched_genre, matched_author, matched_label = ''

      @@array_genres.each do |genre|
        matched_genre = genre[:new_object] if genre[:previous_id] == data['genre']
      end

      @@array_authors.each do |author|
        matched_author = author[:new_object] if author[:previous_id] == data['author']
      end

      @@array_labels.each do |label|
        matched_label = label[:new_object] if label[:previous_id] == data['label']
      end

      new_game = Game.new(data['name'], data['publish_date'], matched_genre,
                          matched_author, matched_label, data['last_played'], data['multiplayer'])

      save_games(new_game, matched_author, matched_genre, matched_label)
    end
  end

  def save_games(new_game, matched_author, matched_genre, matched_label)
    add_games(new_game)
    matched_label.add_item(new_game)
    matched_genre.add_item(new_game)
    matched_author.add_item(new_game)
  end
end
# rubocop:enable Style/ClassVars
# rubocop:enable Metrics/ModuleLength
# rubocop:enable Metrics/PerceivedComplexity
