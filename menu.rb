class List
  @options = ['List of all games',
              'List all music albums',
              'List of games',
              'List all genres',
              'List all labels',
              'List all authors',
              'Add a book',
              'Add a music album',
              'Add a game', 'Exit']

  def self.list
    @options.each_with_index do |option, idx|
      puts "#{idx + 1}) #{option} "
    end
  end
end
