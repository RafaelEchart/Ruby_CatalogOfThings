require 'json'
require_relative './books_memory'
require_relative './album_memory'
require_relative './games_memory'
require_relative './author_memory'
require_relative './genre_memory'
require_relative './label_memory'

module SaveJSON
  include BooksMemory
  include AlbumsMemory
  include GamesMemory
  include AuthorMemory
  include GenreMemory
  include LabelMemory

  def start_save
    # Check books memory is not empty
    check_books_memory
    check_albums_memory
    check_games_memory
    check_author_memory
    check_genre_memory
    check_label_memory
  end

  def check_books_memory
    books = show_books
    return if books.empty?

    array = []
    books.each do |book|
      array.push({ previous_id: book, id: book.id, name: book.name, genre: book.genre, author: book.author,
                   label: book.label, publish_date: book.publish_date,
                   publisher: book.publisher, cover_state: book.cover_state })
    end
    File.write('./data/books.json', JSON.dump(array))
  end

  def check_albums_memory
    albums = show_albums
    return if albums.empty?

    array = []
    albums.each do |album|
      array.push({ previous_id: album, id: album.id, name: album.name, genre: album.genre, author: album.author,
                   label: album.label, publish_date: album.publish_date, on_spotify: album.on_spotify })
    end
    File.write('./data/albums.json', JSON.dump(array))
  end

  def check_games_memory
    games = show_games
    return if games.empty?

    array = []
    games.each do |game|
      array.push({ previous_id: game, id: game.id, name: game.name, genre: game.genre, author: game.author,
                   label: game.label, publish_date: game.publish_date, last_played: game.last_played_at,
                   multiplayer: game.multiplayer })
    end
    File.write('./data/games.json', JSON.dump(array))
  end

  def check_author_memory
    authors = show_authors
    return if authors.empty?

    array = []
    authors.each do |author|
      array.push({ previous_id: author, id: author.id, first_name: author.first_name, last_name: author.last_name,
                   items: author.items })
    end
    File.write('./data/authors.json', JSON.dump(array))
  end

  def check_genre_memory
    genres = show_genres
    return if genres.empty?

    array = []
    genres.each do |genre|
      array.push({ previous_id: genre, id: genre.id, name: genre.name, items: genre.items })
    end
    File.write('./data/genres.json', JSON.dump(array))
  end
  
  def check_label_memory
    labels = show_labels
    return if labels.empty?

    array = []
    labels.each do |label|
      array.push({ previous_id: label, id: label.id, title: label.title, color: label.color, items: label.items })
    end
    File.write('./data/labels.json', JSON.dump(array))
  end

end
