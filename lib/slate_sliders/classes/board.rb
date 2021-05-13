require 'ruby2d'
require_relative 'slates'

class Board

  def initialize
    @side_length = 5
    @board = startup_game_board
    @shapes = []
    @target_shapes = []
  end

  def startup_game_board
    @board = Array.new(@side_length)

    @side_length.times do |column_index|
      @board[column_index] = Array.new(@side_length)
      @side_length.times do |row_index|
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
      x: 5, y: 200,
      size: 405,
      color: '#0E1619',
      z: 0
    )
    Square.new(
      x: 85, y: 275,
      size: 245,
      color: 'blue',
      z: 1
    )

    @board.each.with_index do |row, index|
      row.each do |slate|
        @shapes << Square.new(
          x: 10 + (slate.x_pos * 80), y: 200 + (slate.y_pos * 80),
          z: 2,
          size: 75,
          color: slate.colour
        )
      end
    end
  end

  def inner_game_board
    # Remove outer edges of the tiles
    # Remove anything where y = 0, x = 0, y = 4, x = 4

    @inner_slates = @board.map do |row|
      row.select {|slate| !(slate.x_pos == 0 || slate.x_pos == 4 || slate.y_pos == 0 || slate.y_pos == 4) }
    end.reject(&:empty?)
  end
  
  def target_game_board
    @target_shapes.each do |shape|
      shape.remove 
    end

    @target_shapes = []

    Square.new(
      x: 500, y: 0,
      size: 80 ,
      color: '#0E1619',
      z: 0
    )

    inner_game_board.each.with_index do |row, index|
      row.each do |slate|
        Square.new(
          x: 500 + (slate.x_pos * 20), y: (slate.y_pos * 20),
          size: 18,
          color: slate.colour,
          z: 2
        )
      end
    end
  end

  def make_move(move)
    blank_x, blank_y = blank_slate_position

    case move
    when 'down'
      @board[blank_x][blank_y], @board[blank_x][blank_y + 1] = @board[blank_x][blank_y + 1], @board[blank_x][blank_y]
    when 'up'
      @board[blank_x][blank_y], @board[blank_x][blank_y - 1] = @board[blank_x][blank_y - 1], @board[blank_x][blank_y]
    when 'right'
      @board[blank_x][blank_y], @board[blank_x + 1][blank_y] = @board[blank_x + 1][blank_y], @board[blank_x][blank_y]
    when 'left'
      @board[blank_x][blank_y], @board[blank_x - 1][blank_y] = @board[blank_x - 1][blank_y], @board[blank_x][blank_y]
    else
      raise 'Invalid Move!'
    end

    reassign_slate_coordinates
  end
  
  def reassign_slate_coordinates
    @board.each.with_index do |column, column_index|
      column.each.with_index do |slate, row_index|
        slate.x_pos = column_index
        slate.y_pos = row_index
      end
    end
  end

  def blank_slate_position
    @blank_slate_position = @board.each do |row|
      row.each do |slate|
        if slate.colour == '#0E1619'
          return [slate.x_pos, slate.y_pos]
        end
      end
    end
  end

  def same_inner_board?(other_board)
    inner_game_board.each.with_index do |row, i|
      row.each.with_index do |slate, j|
        if slate.colour != other_board.inner_game_board[i][j].colour
          return false
        end
      end
    end

    true
  end

  def generate_solution_board
    possible_moves = %w[up down left right]

    x = 10
    while x >= 0 do
      random_move = possible_moves.sample
      self.make_move(random_move) if self.is_move_valid?(random_move)
      x -= 1
    end

    loop do
      break if blank_slate_on_edge?
      random_move = possible_moves.sample
      self.make_move(random_move) if self.is_move_valid?(random_move)
    end
  end

  def blank_slate_on_edge?
    blank_x, blank_y = blank_slate_position

    blank_x == 0 || blank_x == 4 || blank_y == 0 || blank_y == 4
  end

  def is_move_valid?(move)
    blank_x, blank_y = blank_slate_position

    if move == 'down' && (blank_y != @side_length - 1)
      true
    elsif move == 'up' && (blank_y != 0)
      true
    elsif  move == 'right' && (blank_x != @side_length - 1)
      true
    elsif  move == 'left' && (blank_x != 0)
      true
    else
      false
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