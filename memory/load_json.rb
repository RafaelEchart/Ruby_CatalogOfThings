# Local memory
require_relative './album_memory'
require_relative './author_memory'
require_relative './books_memory'
require_relative './games_memory'
require_relative './genre_memory'
require_relative './label_memory'
# Classes
require_relative '../classes/music_album'
require_relative '../classes/author'
require_relative '../classes/book'
require_relative '../classes/game'
require_relative '../classes/genre'
require_relative '../classes/label'

module LoadData
  include AlbumsMemory
  include AuthorMemory
  include BooksMemory
  include GamesMemory
  include GenreMemory
  include LabelMemory

  @@array_genres = []
  @@array_authors = []
  @@array_labels = []

  def start_process
    create_genres
    create_authors
    create_labels
    check
  end

  def create_genres
    return unless File.file?('./data/genres.json')

    file = File.read('./data/genres.json')
    data_hash = JSON.parse(file)

    data_hash.each do |data|
      new_genre = Genre.new(data['name'])
      @@array_genres.push({ previous_id: data['previous_id'], new_object: new_genre })
      add_genre(new_genre)
    end
  end

  def create_authors
    return unless File.file?('./data/authors.json')

    file = File.read('./data/authors.json')
    data_hash = JSON.parse(file)

    data_hash.each do |data|
      new_author = Author.new(data['first_name'], data['last_name'])
      @@array_authors.push({ previous_id: data['previous_id'], new_object: new_author })
      add_author(new_author)
    end
  end

  def create_labels
    return unless File.file?('./data/labels.json')

    file = File.read('./data/labels.json')
    data_hash = JSON.parse(file)

    data_hash.each do |data|
      new_label = Label.new(data['title'], data['color'])
      @@array_labels.push({ previous_id: data['previous_id'], new_object: new_label })
      add_label(new_label)
    end
  end




  def check 
  puts "Genre array"
  puts @@array_genres
  puts "Local genre memory"
  puts show_genres
  
  puts "--------------------------------------"
  puts "Author array"
  puts @@array_authors
  puts "Local author memory"
  puts show_authors
 
  puts "--------------------------------------"
  puts "labels array"
  puts @@array_labels
  puts "Local labels memory"
  puts show_labels
end 
end
