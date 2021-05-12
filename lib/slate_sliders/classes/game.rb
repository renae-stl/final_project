class Game

  def initialize
    @board = Board.new
    @solution_board = Board.new
  end

  def game_over?
    @board = @solution_board
  end

end