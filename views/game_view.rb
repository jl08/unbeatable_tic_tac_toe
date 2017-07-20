class GameView


  def display_board(board)
    puts board.formatted_display
  end

  def display_options
    options = {
      1 => "1) Player 1: human vs Player 2: human",
      2 => "2) Player 1: human vs Player 2: ai ",
      3 => "3) Player 1: ai vs Player 2: human"
    }
    options.each do |option, text|
      puts text
    end
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
