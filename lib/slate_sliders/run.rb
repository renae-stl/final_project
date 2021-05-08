#!/usr/bin/env ruby

require_relative 'classes/board'
require_relative 'classes/slates'

slate_sliders = Board.new
slate_sliders.start_screen
pp slate_sliders.slates
# p slate_sliders.print_board
puts "\n\ntarget pattern\n\n"
pp slate_sliders.target_pattern