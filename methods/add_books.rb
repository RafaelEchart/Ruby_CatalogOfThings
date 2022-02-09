require_relative '../classes/book'
require_relative '../classes/author'
require_relative '../classes/genre'
require_relative '../classes/label'
require_relative '../memory/books_memory'
require_relative '../inputs/general_inputs'
require_relative '../inputs/book_inputs'

class AddBooks
  include BooksMemory
  include GeneralInputs
  include BooksInputs

  def add    
    author, title, color, genre, publish_date = general_inputs
    publisher, cover_state = books_input

    # # Creation of new author
    # # new_author = Author.new(author_first_name, author_last_name)
    # # Creation of new genre
    # # new_genre = Genre.new(genre)
    # # Creation of label
    # new_label = Label.new(title, color)
    # # Creation of new book
    # new_book = Book.new(publisher, cover_state, publish_date, new_genre, author, new_label)

    # # new_author.add_item(new_book)
    # # new_genre.add_item(new_book)
    # new_label.add_item(new_book)

    # p new_book

    puts 'Book created successfully'
  end
end
