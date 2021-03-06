require_relative './author_inputs'
require_relative './genre_inputs'
require_relative './label_inputs'

module GeneralInputs
  include AuthorInputs
  include GenreInputs
  include LabelInputs

  def general_inputs
    author = check_authors
    genre = check_genres
    label = check_labels
    print 'Please enter publish date in a format [ YYYY-MM-DD ]: '
    publish_date = gets.chomp

    [author, label, genre, publish_date]
  end
end
