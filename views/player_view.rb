class PlayerView

  def initialize
  end


  def get_move(options)
    move = gets.chomp.to_i
    if !options.include?(move)
      puts "Not a valid spot. Please try again"
      until options.include?(move) do
        move = gets.chomp.to_i
      end
    end
    puts "get_move"
    puts "move"
    puts move
    move
  end

end
