class Game

  def initialize
    @board = Board.new
    @target_board = Board.new
  end

  def game_over?
    @board = @target_board
  end

end