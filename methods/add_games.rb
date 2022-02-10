require_relative '../inputs/general_inputs'
require_relative '../classes/game'
require_relative '../inputs/game_inputs'
require_relative '../memory/games_memory'

class AddGames
  include GamesMemory
  include GeneralInputs
  include GamesInputs

  def add
    name, last_date, multiplayer = games_input
    author, label, genre, publish_date = general_inputs

    new_game = Game.new(name, publish_date, genre, author, label, last_date, multiplayer)
    add_games(new_game)

    label.add_item(new_game)
    genre.add_item(new_game)
    author.add_item(new_game)

    puts 'Game created successfully'
  end
end
