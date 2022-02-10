module GamesInputs
    def games_input
      print 'Please enter the game name: '
      name = gets.chomp
      print 'Last date this game was played in a format [ YYYY-MM-DD ]: '
      last_date = gets.chomp
      print '¿Does this game has multiplayer? [Y/N]: '
      multiplayer = gets.chomp
      multiplayer = multiplayer == 'y'
      [name, last_date, multiplayer]
    end
  end