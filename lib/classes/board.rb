class Board

  def initialize
    @board = 2
    @size = 5
  end

  def create_board(row_index, column_index)
    @board = Array.new(@size)
    @size.times do |column_index|
      @board[column_index] = Array.new(@size)
      @size.times do |row_index|
        @board[column_index][row_index] =  Slates.new(row_index, column_index)
      end
    end
  end

  def print_board
    p @board
  end
  
end