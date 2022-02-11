# rubocop:disable Style/ClassVars
module GamesMemory
  @@games = []

  def add_games(new_game)
    @@games << new_game
  end

  def show_games
    @@games
  end
end
# rubocop:enable Style/ClassVars
