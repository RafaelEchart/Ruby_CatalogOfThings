module BooksInputs
  def books_input
    print 'Please enter the publisher name: '
    publisher = gets.chomp
    print 'Please enter the cover state [good, medium, bad]: '
    cover_state = gets.chomp
    [publisher, cover_state]
  end
end
