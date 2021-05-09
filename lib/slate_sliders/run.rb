#!/usr/bin/env ruby

require_relative 'classes/board'
require_relative 'classes/slates'

slate_sliders = Board.new
slate_sliders.start_screen
puts "\n\nStartup All Slates\n\n"
pp slate_sliders.startup_all_slates
# puts "\n\nStartup Inner Slates\n\n"
# pp slate_sliders.startup_inner_slates
# puts "\n\nTarget Pattern\n\n"
# TARGET_PATTERN = slate_sliders.target_pattern
# pp TARGET_PATTERN
# pp slate_sliders.print_board
