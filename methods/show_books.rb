require_relative '../memory/books_memory'
require 'io/console'

class ShowBooks
  include BooksMemory

  def initialize
    @books = show_books
  end

  def show
    puts ''
    if @books.length.positive?
      selected_book = @books.length + 1
      while selected_book > @books.length
        @books.each do |book|
          puts "#{@books.find_index(book)}) Title: #{book.name}, Author: #{book.author.first_name}"
        end
        puts "#{@books.length}) EXIT TO MENU"
        puts 'Please select a book for information'
        selected_book = gets.chomp.to_i
      end

      if selected_book < @books.length
        puts "Title: #{@books[selected_book].name}"        
        puts "Author: #{@books[selected_book].author.first_name} #{@books[selected_book].author.last_name}"        
        puts "Genre: #{@books[selected_book].genre.name}"        
        puts "Published Date: #{@books[selected_book].publish_date}"        
        puts "Publisher: #{@books[selected_book].publisher}"        
        puts "Label: #{@books[selected_book].label.title}"     
        #Press any key to continue   
      end
    else
      puts 'Empty Library, add a book first'

    end
  end
end
