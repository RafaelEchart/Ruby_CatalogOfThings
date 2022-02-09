require_relative './author_inputs.rb'
require_relative './genre_inputs.rb'
module GeneralInputs
  include AuthorInputs
  include GenreInputs

  def general_inputs
    author = check_authors
    print 'Title: '
    title = gets.chomp
    print 'Color: '
    color = gets.chomp
    genre = check_genres
    print 'Please enter publish date in a format [ YYYY-MM-DD ]: '
    publish_date = gets.chomp

    #Ask for labels
    [author, title, color, genre, publish_date]
  end

 
end
