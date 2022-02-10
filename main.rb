require_relative './methods/add_books'
require_relative './methods/show_books'
require_relative './methods/add_albums'
require_relative './methods/show_albums'
require_relative './methods/add_games'
require_relative './methods/show_games'
require_relative './methods/show_genre'
require_relative './methods/show_authors'
require_relative './methods/show_labels'
require_relative 'menu'

class App
  def welcome
    @add_books = AddBooks.new
    @show_books = ShowBooks.new
    @add_albums = AddAlbums.new
    @show_albums = ShowAlbums.new
    @add_games = AddGames.new
    @show_games = ShowGames.new
    @show_genres = ShowGenre.new
    @show_authors = ShowAuthor.new
    @show_labels = ShowLabel.new
    menu
  end

  def choice(selected_option)
    case selected_option

    when '1' then @show_books.show
    when '2' then @show_albums.show
    when '3' then @show_games.show
    when '4' then @show_genres.show
    when '5' then @show_labels.show
    when '6' then @show_authors.show
    when '7' then @add_books.add
    when '8' then @add_albums.add
    when '9' then @add_games.add
    when '10'
      puts "\nThanks for your visit, have a great day!"
      abort

    end
    menu
  end

  def menu
    List.list
    selected_option = gets.chomp
    choice(selected_option)
  end
end

def main
  app = App.new
  app.welcome
end

main
