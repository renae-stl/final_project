#!/usr/bin/env ruby

require_relative 'classes/board'
require_relative 'classes/slates'

slate_sliders = Board.new

slate_sliders.start_screen
puts
puts "* Startup All Slates **\n\n"
pp slate_sliders.startup_all_slates
puts
puts "** Print Board **\n\n"
slate_sliders.print_board

#TARGET_PATTERN
# TARGET_PATTERN = slate_sliders.target_pattern
# pp TARGET_PATTERN
