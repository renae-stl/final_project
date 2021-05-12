#!/usr/bin/env ruby
require 'ruby2d'
require_relative 'classes/board'
require_relative 'classes/slates'
require_relative 'classes/game'

slate_sliders = Board.new

set( { 
    :title => 'Slate Sliders!' ,
    :background => 'gray',
} )




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

tick = 0

update do
  if tick % 60 == 0
    slate_sliders.inner_game_board
  end
  tick += 1
end

on :key_down do
    slate_sliders.make_move('up')
end
on :mouse_down do
    Window.clear
    slate_sliders.inner_game_board
    slate_sliders.solution_board
end

puts
puts "** Current Position Of Blank Slate **\n\n"
# pp slate_sliders.blank_slate_position

show
