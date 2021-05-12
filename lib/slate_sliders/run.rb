#!/usr/bin/env ruby

require_relative 'classes/board'
require_relative 'classes/slates'
require_relative 'classes/game'

slate_sliders = Board.new

slate_sliders.start_screen
puts
puts "** Startup Game Board **\n\n"
pp slate_sliders.startup_game_board
puts
puts "** Print Game Board **\n\n"
slate_sliders.print_game_board
puts
puts "** Inner Game Board **\n\n"
pp slate_sliders.inner_game_board

# puts
# puts "** SOLUTION BOARD **\n\n"

#slate_sliders.timer

puts
puts "** Current Position Of Blank Slate **\n\n"
# pp slate_sliders.blank_slate_position
