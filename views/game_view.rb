class GameView

  def display_board(board)
    puts "---"
    formatted_board = board.grid.map.with_index do |cell, index|
      cell_display = cell
      if cell_display.nil?
        cell_display = index
      end
      if index == 2 || index == 5 || index == 8
        cell_display.to_s + "\n"
      else
        cell_display.to_s
      end
    end
    puts formatted_board.join("")
    puts "---"
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
    until [1,2,3].include?(user_choice) do
      puts "Invalid choice. Please try again."
      user_choice = get_game_option
    end
    user_choice
  end

end
