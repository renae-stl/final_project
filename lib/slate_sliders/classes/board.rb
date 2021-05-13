require 'ruby2d'
require_relative 'slates'

# beginning of the game : generate a board 5x5 (initial board = A) -> player starts on this board
# to find the target board: for N iterations (e.g at least 5 and then as soon as there's no blank tile in the 3x3 center), swap the blank tile with a random adjacent tile
# at the end, you have the target board (B) -> truncate the edges (3x3) -> give the target center to the player as goal

class Board

  #attr_reader :board

  def initialize
    @size = 5
    @board = startup_game_board
    @shapes = []
    @target_shapes = []
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
        @board[column_index][row_index] = Slates.new(column_index, row_index)
      end
    end

    @board
  end

  def print_game_board
    @shapes.each do |shape|
      shape.remove 
    end
    @shapes = []
    Square.new(
      x: 5,
      y: 200,
      size: 405 ,
      color: 'black',
      z: 0
    )
    output = "      0      1      2      3      4"
    @board.each.with_index do |row, index|
      output += "\n #{index} "
      row.each do |slate|
        output += slate.to_string
        @shapes << Square.new(
          x: 10 + (slate.x * 80),
          y: 200 + (slate.y * 80),
          size: 75,
          color: slate.colour,
          z: 1
        )
      end
    end
  
  #  puts output
  end

  def inner_game_board
    # Remove outer edges of the tiles
    # Remove anything where y = 0, x = 0, y = 4, x = 4

    @inner_slates = @board.map do |row|
      row.select {|slate| !(slate.x == 0 || slate.x == 4 || slate.y == 0 || slate.y == 4) }
    end.reject(&:empty?)
  end
  
  def current_game_board
    @target_shapes.each do |shape|
      shape.remove 
    end
    @target_shapes = []
    Square.new(
      x: 500,
      y: 0,
      size: 80 ,
      color: 'black',
      z: 0
    )
    output = "      0      1      2      3      4"
    @inner_slates.each.with_index do |row, index|
      output += "\n #{index} "
      row.each do |slate|
        Square.new(
          z: 2,
          x: 500 + (slate.x * 20),
          y: (slate.y * 20),
          size: 18,
          color: slate.colour
        )
        output += slate.to_string
      end
    end
  end

  def make_move(move)
    blank_x, blank_y = blank_slate_position

    # this also needs to handle when a move shouldn't happen because the black slate
    # is on the edge

    case move
    when "up"
      @board[blank_x][blank_y], @board[blank_x][blank_y + 1] = @board[blank_x][blank_y + 1], @board[blank_x][blank_y]
    when "down"
      @board[blank_x][blank_y], @board[blank_x][blank_y - 1] = @board[blank_x][blank_y - 1], @board[blank_x][blank_y]
    when "left"
      @board[blank_x][blank_y], @board[blank_x + 1][blank_y] = @board[blank_x + 1][blank_y], @board[blank_x][blank_y]
    when "right"
      @board[blank_x][blank_y], @board[blank_x - 1][blank_y] = @board[blank_x - 1][blank_y], @board[blank_x][blank_y]
    else
      raise "Invalid Move!"
    end

    reassign_slate_coordinates
  end
  
  def reassign_slate_coordinates
    @board.each.with_index do |column, column_index|
      column.each.with_index do |slate, row_index|
        slate.x = column_index
        slate.y = row_index
      end
    end
  end

  def blank_slate_position
    @blank_slate_position = @board.each do |row|
      row.each do |slate|
        if slate.colour == "black"
          return [slate.x, slate.y]
        end
      end
    end
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