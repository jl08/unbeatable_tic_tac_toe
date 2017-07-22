class PlayerView

  def get_move(options, marker)
    puts marker + " turn"
    move = gets.chomp.to_i
    if !options.include?(move)
      until options.include?(move) do
        puts "Not a valid spot. Please try again"
        move = gets.chomp.to_i
      end
    end
    move
  end

end
