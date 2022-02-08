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
    # puts 'List of all movies'

  end
end

menu
