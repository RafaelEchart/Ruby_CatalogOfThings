require_relative '../memory/games_memory'

class ShowGames
  include GamesMemory

  def initialize
    @games = show_games
  end

  def show
    puts ''
    if @games.length.positive?
      selected_game = @games.length + 1
      while selected_game > @games.length
        @games.each do |game|
          puts "#{@games.find_index(game)}) Title: #{game.name}, Author: #{game.author.first_name}"
        end
        puts ""
        puts "#{@games.length}) EXIT TO MENU"
        puts 'Please select a game for more information'
        selected_game = gets.chomp.to_i
      end

      if selected_game < @games.length
        puts "Title: #{@games[selected_game].name}"        
        puts "Author: #{@games[selected_game].author.first_name} #{@games[selected_game].author.last_name}"        
        puts "Genre: #{@games[selected_game].genre.name}"        
        puts "Last Played at: #{@games[selected_game].last_played_at}"        
        puts "Published Date: #{@games[selected_game].publish_date}"        
        puts "Label: #{@games[selected_game].label.title}"     
        #Press any key to continue   
      end
    else
      puts 'Empty Library, add a game first'

    end
  end
end
