require 'matrix'

require_relative 'classes/board'
require_relative 'classes/target_board'
require_relative 'classes/slates'

# board = Board.new
# target_board = TargetBoard.new
# slates = Slates.new

=begin

 rows randomly generated from random.org for 3x3 and 5X5 matrices

=end

# slate colours

slate_colours = {
  0 => "Black", 1 => "Green", 2 => "Red",
  3 => "Blue", 4 => "Orange", 5 => "Yellow",
  6 => "White"
}

# target board and board

three_by_three_matrix = [
  [1,2,4],
  [5,5,6],
  [4,3,5]
]

five_by_five_matrix = [
  [5,6,6,6,5],
  [3,3,2,3,6],
  [4,2,0,4,6],
  [1,4,6,5,4],
  [4,3,4,1,4]
]

# Random matrices using class matrix

pattern = Matrix.build(3, 3) { |row, col| rand(1..6) }
board = Matrix.build(5, 5) {
  |row, col| row == 2 && col == 2 ? 0 : rand(1..6)
}

puts three_by_three_matrix
puts five_by_five_matrix
puts pattern
puts board

# Compare matrices

three_by_three_matrix_2 = [
  [1,2,4],
  [5,5,6],
  [4,3,5]
]

if three_by_three_matrix == three_by_three_matrix_2
  puts 'Match: Matrix and Matrix 2'
end

three_by_three_matrix_3 = [
  [4,4,4],
  [5,5,6],
  [6,3,5]
]

if three_by_three_matrix == three_by_three_matrix_3
  puts 'Match: Matrix and Matrix 3'
else
  puts 'No match: Matrix and Matrix 3'
end

# Printing individual elements

# Rows by Columns
#       0 1 2
#    0 [(0,0),(0,1),(0,2)]
#    1 [(1,0),(1,1),(1,2)]
#    2 [(2,0),(2,1),(2,2)]

three_by_three_matrix_4 = [
  [1,2,4],
  [5,5,6],
  [4,3,5]
]

# row 1
puts three_by_three_matrix_4[0][0]
puts three_by_three_matrix_4[0][1]
puts three_by_three_matrix_4[0][2]

# row 2
puts three_by_three_matrix_4[1][0]
puts three_by_three_matrix_4[1][1]
puts three_by_three_matrix_4[1][2]

# row 3
puts three_by_three_matrix_4[2][0]
puts three_by_three_matrix_4[2][1]
puts three_by_three_matrix_4[2][2]

# Map a matrix to a hash

three_by_three_matrix_5 = [
  [1,2,4],
  [5,5,6],
  [4,3,5]
]

puts three_by_three_matrix_5.hash()

# Ryan's hash idea

# 3X3 matrix
#       0 1 2
#    0 [(0,0),(0,1),(0,2)]
#    1 [(1,0),(1,1),(1,2)]
#    2 [(2,0),(2,1),(2,2)]

# Pattern
#   [1,2,4]
#   [5,5,6]
#   [4,3,5]

# Slate colour map
#   0 => "Black", 1 => "Green", 2 => "Red",
#   3 => "Blue", 4 => "Orange", 5 => "Yellow",
#   6 => "White"

CURRENT_GAME_STATE = {
  0 => { 0 => '1', 1 => '2', 2 => '4' },
  1 => { 0 => '5', 1 => '5', 2 => '6' },
  2 => { 0 => '4', 1 => '3', 2 => '5' }
}

puts "Current game state: #{CURRENT_GAME_STATE[2][2]}"

# 5X5 matrix
#       0 1 2 3 4
#    0 [(0,0),(0,1),(0,2),(0,3),(0,4)]
#    1 [(1,0),(1,1),(1,2),(1,3),(1,4)]
#    2 [(2,0),(2,1),(2,2),(2,3),(2,4)]
#    3 [(3,0),(3,1),(3,2),(3,3),(3,4)]
#    4 [(4,0),(4,1),(4,2),(4,3),(4,4)]

# Pattern
#   [5,6,6,6,5]
#   [3,3,2,3,6]
#   [4,2,0,4,6]
#   [1,4,6,5,4]
#   [4,3,4,1,4]

# Slate colour map
#   0 => "Black", 1 => "Green", 2 => "Red",
#   3 => "Blue", 4 => "Orange", 5 => "Yellow",
#   6 => "White"

START_GAME_STATE = {
  0 => { 0 => '5', 1 => '6', 2 => '6', 3 => '6', 4 => '5' },
  1 => { 0 => '3', 1 => '3', 2 => '2', 3 => '3', 4 => '6' },
  2 => { 0 => '4', 1 => '2', 2 => '0', 3 => '4', 4 => '6' },
  3 => { 0 => '1', 1 => '4', 2 => '6', 3 => '5', 4 => '4' },
  4 => { 0 => '4', 1 => '3', 2 => '4', 3 => '1', 4 => '4' }
}

puts "Current game state: #{START_GAME_STATE[2][2]}"

hash = {}
9.times { |n| hash[n] = rand(1..6) }
p hash
