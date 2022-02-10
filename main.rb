require_relative './methods/add_books'
require_relative './methods/show_books'
require_relative './methods/add_albums'
require_relative './methods/show_albums'
require_relative 'menu'

class App
  def welcome
    @add_books = AddBooks.new
    @show_books = ShowBooks.new
    @add_albums = AddAlbums.new
    @show_albums = ShowAlbums.new
    menu
  end

  def choice(selected_option)
    case selected_option

    when '1'
      @show_books.show
    when '2'
      @show_albums.show
    when '3'
      # List of games
    when '4'
      # List of all genre
    when '5'
      # List of all labels
    when '6'
      # List of authors
    when '7'
      @add_books.add
    when '8'
      @add_albums.add
    when '9'
      # Add a game
    when '10'
      # Exit

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
