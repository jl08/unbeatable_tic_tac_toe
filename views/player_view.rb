class PlayerView

  def get_move(options, marker)
    puts marker + " turn"
    move = gets.chomp.to_i
    until options.include?(move) do
      puts "Not a valid spot. Please try again"
      move = gets.chomp.to_i
    end
    move
  end

end
