class Board
  attr_reader :grid

  def initialize(board = nil)
    @grid =  board || Array.new(9)
  end

  def formatted_display
    formatted_board = @grid.map.with_index do |cell, index|
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
    formatted_board.join("")
  end

  def has_empty_slot_under?(position)

    if position > 5
      return false
    end

    if position < 6
      tile_right_below = @grid[position + 3]
      if tile_right_below.nil?
        return true
      end
      if position < 3
        next_tile_below = @grid[position + 6]
        # binding.pry

        if next_tile_below.nil?
          return true
        end
      end
    end
    false
  end

  def has_row_match?(marker)
    if marker.nil?
      return false
    end
    first_column = [0,3,6]
    three_in_a_row = false
    first_column.each do |row_index|
      if @grid[row_index] == marker && @grid[row_index + 1] == marker && @grid[row_index + 2] == marker
        three_in_a_row = true
        break
      end
    end
    three_in_a_row
  end

  def has_vertical_match?(marker)
    first_row = [0,1,2]
    three_in_a_column = false
    first_row.each do |col_index|
      if @grid[col_index] == marker && @grid[col_index + 3] == marker && @grid[col_index + 6] == marker
        three_in_a_column = true
        break
      end
    end
    three_in_a_column
  end

  def has_diagonal_match?(marker)
    if @grid[0] == marker && @grid[0] == @grid[4] && @grid[0] == @grid[8]
      return true
    end
    false
  end

  def has_other_diagonal_match?(marker)
    if @grid[2] == marker && @grid[2] == @grid[4] && @grid[2] == @grid[6]
      return true
    end
    false
  end

  def is_full?
    !@grid.include?(nil)
  end

  def is_winner?(marker)
    if has_row_match?(marker) || has_vertical_match?(marker) || has_diagonal_match?(marker) || has_other_diagonal_match?(marker)
      return true
    end
    false
  end

  def remaining_options
    options = []
    @grid.each_with_index do |tile, position|
      if tile.nil? && valid_placement?(position)
        options << position
      end
    end
    options
  end

  def to_s
    @grid.to_s
  end

  def update(position, marker)
    if !position.nil?
      puts @grid[position.to_i]
     @grid[position.to_i] = marker
   end
  end

  def valid_placement?(position)
    if has_empty_slot_under?(position)
      return false
    end
    true
  end


end
