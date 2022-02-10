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
    name, publisher, cover_state = books_input
    author, label, genre, publish_date = general_inputs

    new_book = Book.new(name, publisher, cover_state, publish_date, genre, author, label)
    add_books(new_book)

    label.add_item(new_book)
    genre.add_item(new_book)
    author.add_item(new_book)

    puts 'Book created successfully'
  end
end
