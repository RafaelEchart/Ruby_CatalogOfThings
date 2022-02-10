require_relative '../memory/author_memory'

class ShowAuthor
  include AuthorMemory

  def initialize
    @authors = show_authors
  end

  def show
    puts ''
    if @authors.length.positive?
      selected_author = @authors.length + 1
      while selected_author > @authors.length
        @authors.each do |author|
          author_name = "#{author.first_name} #{author.last_name}"
          puts "#{@authors.find_index(author)}) Name: #{author_name} , Count: #{author.items.length}"
        end
        puts ''
        puts "#{@authors.length}) EXIT TO MENU"
        puts 'Please select a genre for more information'
        selected_author = gets.chomp.to_i
      end

      if selected_author < @authors.length
        books = []
        albums = []
        games = []

        @authors[selected_author].items.each do |item|
          instance_name_class = item.class.to_s
          books.push(item) if instance_name_class == 'Book'
          games.push(item) if instance_name_class == 'Game'
          albums.push(item) if instance_name_class == 'MusicAlbum'
        end

        author_name = "#{@authors[selected_author].first_name} #{@authors[selected_author].last_name}"
        author_count = @authors[selected_author].items.length.to_s
        puts "AUTHOR: #{author_name} , COUNT: #{author_count} "
        puts '------------------------------------------------------'

        if books.length.positive?
          puts ''
          puts "               Books [#{books.length}]                     "
          puts ''

          books.each do |book|
            puts "- Title: #{book.name}, Author: #{book.author.first_name}"
          end
          puts '------------------------------------------------------'

        end

        if albums.length.positive?
          puts ''
          puts "               Albums [#{albums.length}]                   "
          puts ''

          albums.each do |album|
            puts "- Title: #{album.name}, Author: #{album.author.first_name}"
          end
          puts '------------------------------------------------------'
        end

        if games.length.positive?
          puts ''
          puts "               Games [#{games.length}]                      "
          puts ''
          games.each do |game|
            puts "- Title: #{game.name}, Author: #{game.author.first_name}"
          end
          puts '------------------------------------------------------'

        end

        # Press any key to continue
      end
    else
      puts 'Empty Library, add a genre first'

    end
  end
end
