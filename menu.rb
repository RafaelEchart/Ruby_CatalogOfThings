class List
  def initialize
    @options = ['List of all',
                'List all music albums',
                'List all movies',
                'List of games',
                'List all genres',
                'List all labels',
                'List all authors',
                'List all sources',
                'Add a book',
                'Add a music album',
                'Add a movie',
                'Add a game']
  end

  def self.list
    @options.each_with_index do |option, idx|
      puts "#{idx + 1}) #{option} "
    end
  end
end
