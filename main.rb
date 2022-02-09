require_relative 'menu'

def menu
  List.list
  selected_option = gets.chomp
  choice(selected_option)
end

def choice(selected_option)
  case selected_option

  when '1'
    # puts 'List of all games'
  when '2'
    # puts 'List of all music albums'
  when '3'
    # List of games
  when '4'
    # List of all genre
  when '5'
    # List of all labels
  when '6'
    # List of authors
  when '7'
    # Add a book
  when '8'
    # Add a music album
  when '9'
    # Add a game
  when '10'
    # Exit

  end
end

menu
