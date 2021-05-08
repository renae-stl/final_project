class Board

  def initialize
    @size = 5
  end

  def start_screen
    puts "-" * 16
    puts ' Slate! Sliders '
    puts "-" * 16
    puts
    puts '@ 2021 Team Earth'
    puts
  end

  def slates
    @board = Array.new(@size)
    @size.times do |column_index|
      @board[column_index] = Array.new(@size)
      @size.times do |row_index|
        @board[column_index][row_index] = Slates.new(row_index, column_index)
      end
    end
    @board
  end

  def target_pattern
    constant = @board
    puts "target pattern\n\n"
    constant
  end

  # target_pattern - which will solve the puzzle
  # initial_board_pattern
  # current_board_pattern
  def print_board

  end

  def timer
    nil
  end

  def timer_slider
    nil
  end
  
end