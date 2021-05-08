class Board

  def initialize
    @size = 3
  end

  def start_screen
    puts "-" * 16
    puts ' Slate! Sliders '
    puts "-" * 16
    puts
    puts '@ 2021 Team Earth'
    puts
  end

  def create_board
    board = Array.new(@size)
    @size.times do |column_index|
      board[column_index] = Array.new(@size)
      @size.times do |row_index|
        board[column_index][row_index] = Slates.new(row_index, column_index)
      end
    end
    board
  end

  def print_board
    nil
  end

  def timer
    nil
  end

  def timer_slider
    nil
  end
  
end