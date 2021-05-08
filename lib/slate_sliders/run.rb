#!/usr/bin/env ruby

require_relative 'classes/board'
require_relative 'classes/slates'

# Slate colour map
#  0 => "Black", 1 => "Green", 2 => "Red",
#  3 => "Blue", 4 => "Orange", 5 => "Yellow",
#  6 => "White"

slate_sliders = Board.new
slate_sliders.start_screen
pp slate_sliders.create_board

