require 'json'
require_relative './books_memory'
require_relative './album_memory'
require_relative './games_memory'

module SaveJSON
  include BooksMemory
  include AlbumsMemory
  include GamesMemory

  def start_save
    # Check books memory is not empty
    check_books_memory
    check_albums_memory
    check_games_memory
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

    p games
    array = []
    games.each do |game|
      array.push({ previous_id: game, id: game.id, name: game.name, genre: game.genre, author: game.author,
                   label: game.label, publish_date: game.publish_date, last_played: game.last_played_at,
                   multiplayer: game.multiplayer })
    end
    File.write('./data/games.json', JSON.dump(array))
  end
end
