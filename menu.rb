class List
  @options = ['List all books',
              'List all music albums',
              'List all movies',
              'List of games',
              'List all genres',
              'List all labels',
              'List all authors',
              'Add a book',
              'Add a music album',
              'Add a movie',
              'Add a game']

  def self.list
    @options.each_with_index do |option, idx|
      puts "#{idx}) #{option} "
    end
  end
end
