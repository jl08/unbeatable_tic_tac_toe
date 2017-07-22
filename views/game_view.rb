class GameView

  def display_board(board)
    puts board.formatted_display
  end

  def display_instructions
    puts "Player 1 will start. \n Select the number you'd like to place your chip!"
  end

  def display_options
    puts "1) Player 1: human vs Player 2: human \n2) Player 1: human vs Player 2: ai \n3) Player 1: ai vs Player 2: human"
  end

  def display_winner(winner)
    winner_name = "No one "
    if !winner.nil?
      winner_name = winner.marker
    end
    puts winner_name + " is the winner"
  end

  def get_game_option
    user_choice = gets.chomp.to_i
    if ![1,2,3].include?(user_choice)
      puts "Invalid choice. Please try again."
      until [1,2,3].include?(user_choice) do
        user_choice = get_game_option
      end
    end
    user_choice
  end

end
