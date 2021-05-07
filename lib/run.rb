require 'matrix'
require_relative 'classes/board'
require_relative 'classes/slates'

# Slate colour map
#   0 => "Black", 1 => "Green", 2 => "Red",
#   3 => "Blue", 4 => "Orange", 5 => "Yellow",
#   6 => "White"

slate_sliders = Board.new 
slate_sliders.create_board(3, 3)
slate_sliders.print_board
# def create_board(row_index, column_index)
#     size = 5
#     board = Array.new(size)
#     size.times do |column_index|
#       board[column_index] = Array.new(size)
#       size.times do |row_index|
#         board[column_index][row_index] =  Slates.new(row_index, column_index)
#       end
#     end
#     p board
#     p board.length
#   end
  
#   create_board(5, 5)

