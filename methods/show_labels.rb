require_relative '../memory/label_memory'

class ShowLabel
  include LabelMemory

  def initialize
    @labels = show_labels
  end

  def show
    puts ''
    if @labels.length.positive?
      selected_label = @labels.length + 1
      while selected_label > @labels.length
        @labels.each do |label|
          puts "#{@labels.find_index(label)}) Name: #{label.title}, Count: #{label.items.length}"
        end
        puts ''
        puts "#{@labels.length}) EXIT TO MENU"
        puts 'Please select a label for more information'
        selected_label = gets.chomp.to_i
      end

      organize_data(selected_label)
    else
      puts 'Empty Library, add a label first'

    end
  end

  def organize_data(selected_label)
    return unless selected_label < @labels.length

    books = []
    albums = []
    games = []

    @labels[selected_label].items.each do |item|
      instance_name_class = item.class.to_s
      books.push(item) if instance_name_class == 'Book'
      games.push(item) if instance_name_class == 'Game'
      albums.push(item) if instance_name_class == 'MusicAlbum'
    end

    puts "LABEL: #{@labels[selected_label].title}, COUNT: #{@labels[selected_label].items.length} "
    puts '-------------------------------------------------------------'

    show_books(books)
    show_albums(albums)
    show_games(games)
    # Press any key to continue
  end

  def show_books(books)
    return unless books.length.positive?

    puts ''
    puts "               Books [#{books.length}]                     "
    puts ''

    books.each do |book|
      puts "- Title: #{book.name}, Author: #{book.author.first_name}"
    end
    puts '------------------------------------------------------'
  end

  def show_albums(albums)
    return unless albums.length.positive?

    puts ''
    puts "               Albums [#{albums.length}]                   "
    puts ''

    albums.each do |album|
      puts "- Title: #{album.name}, Author: #{album.author.first_name}"
    end
    puts '------------------------------------------------------'
  end

  def show_games(games)
    return unless games.length.positive?

    puts ''
    puts "               Games [#{games.length}]                      "
    puts ''
    games.each do |game|
      puts "- Title: #{game.name}, Author: #{game.author.first_name}"
    end
    puts '------------------------------------------------------'
  end
end
