require_relative './author_inputs.rb'
require_relative './genre_inputs.rb'
require_relative './label_inputs.rb'

module GeneralInputs
  include AuthorInputs
  include GenreInputs
  include LabelInputs

  def general_inputs
    label = check_labels
    author = check_authors
    genre = check_genres
    print 'Please enter publish date in a format [ YYYY-MM-DD ]: '
    publish_date = gets.chomp

    [author, label, genre, publish_date]
  end
end
