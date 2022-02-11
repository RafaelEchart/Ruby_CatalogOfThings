class List
  @options = ['List all books',
              'List all music albums',
              'List of games',
              'List all genres',
              'List all labels',
              'List all authors',
              'Add a book',
              'Add a music album',
              'Add a game']

  def self.list
    @options.each_with_index do |option, idx|
      puts "#{idx + 1}) #{option} "
    end
    puts "#{@options.length + 1}) Exit"
  end
end
