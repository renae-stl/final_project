require_relative 'slates'

# beginning of the game : generate a board 5x5 (initial board = A) -> player starts on this board
# to find the target board: for N iterations (e.g at least 5 and then as soon as there's no blank tile in the 3x3 center), swap the blank tile with a random adjacent tile
# at the end, you have the target board (B) -> truncate the edges (3x3) -> give the target center to the player as goal

class Board

  #attr_reader :board

  def initialize
    @size = 5
    @board = startup_game_board
  end

  def start_screen
    puts
    puts "-" * 16
    puts ' Slate! Sliders '
    puts "-" * 16
    puts
    puts '@ 2021 Team Earth'
    puts
  end

  def startup_game_board
    @board = Array.new(@size)

    @size.times do |column_index|
      @board[column_index] = Array.new(@size)
      @size.times do |row_index|
        @board[column_index][row_index] = Slates.new(row_index, column_index)
      end
    end

    @board
  end

  def print_game_board
    output = "      0      1      2      3      4"
    @board.each.with_index do |row, index|
      output += "\n #{index} "
      row.each do |slate|
        output += slate.to_string
      end
    end
  
    puts output
  end

  def inner_game_board
    # Remove outer edges of the tiles
    # Remove anything where y = 0, x = 0, y = 4, x = 4

    @inner_slates = @board.map do |row|
      row.select {|slate| !(slate.x == 0 || slate.x == 4 || slate.y == 0 || slate.y == 4) }
    end.reject(&:empty?)
  end
  
  def solution_board
    nil
  end

  def make_move(move)
    blank_x, blank_y = blank_slate_position

    case move
    when move == "up"
      @board[blank_x][blank_y], @board[blank_x][blank_y + 1] = @board[blank_x][blank_y + 1], @board[blank_x][blank_y]
    when move == "down"
      @board[blank_x][blank_y], @board[blank_x][blank_y - 1] = @board[blank_x][blank_y - 1], @board[blank_x][blank_y]
    when move == "left"
      @board[blank_x][blank_y], @board[blank_x + 1][blank_y] = @board[blank_x + 1][blank_y], @board[blank_x][blank_y]
    when move == "right"
      @board[blank_x][blank_y], @board[blank_x - 1][blank_y] = @board[blank_x - 1][blank_y], @board[blank_x][blank_y]
    else
      raise "Invalid Move!"
    end
  end

  def blank_slate_position
    @blank_slate_position = @board.map do |row|
      if @board[x, y].instance_variable_get(:@colour) == "blank"
        row.select { |slate| slate[x][y] }
      end
    end.reject(&:empty?)
  end

  def timer
    max_time_min = 2 # time in minutes
    max_time_sec = Time.now + max_time_min.to_i*60

    while Time.now <= max_time_sec
      sleep 1

      t = max_time_sec - Time.now
      min, sec = t/60, t%60
      print "\b"*5
      printf "%02d:%02d", min, sec if t > 0

    end
  end

end