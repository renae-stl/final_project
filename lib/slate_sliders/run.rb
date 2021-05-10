#!/usr/bin/env ruby

require_relative 'classes/board'
require_relative 'classes/slates'
require_relative 'classes/timer'
slate_sliders = Board.new

slate_sliders.start_screen
puts
puts "** Startup All Slates **\n\n"
pp slate_sliders.startup_all_slates
puts
puts "** Print Board **\n\n"
slate_sliders.print_board

puts
puts "** Print Startup Inner Slates **\n\n"
slate_sliders.print_inner_board(slate_sliders.startup_inner_slates)
puts
puts "** TARGET PATTERN **\n\n"
TARGET_PATTERN = slate_sliders.target_pattern
slate_sliders.print_inner_board(TARGET_PATTERN)