#!/usr/bin/env ruby
require 'ruby2d'
require_relative 'classes/board'
require_relative 'classes/slates'
require_relative 'classes/game'

slate_sliders = Board.new

set( { 
    :title => 'Slate Sliders!' ,
    :background => 'gray',
    :width => 600,
    :height => 600,
} )

music = Music.new('./resources/music/Kid_Icarus_Uprising_Black_Feathers_in_the_Sky_OC_ReMix.mp3')
music.play
music.volume = 0

slate_sliders.start_screen
puts
puts "** Startup Game Board **\n\n"
pp slate_sliders.startup_game_board
puts
puts "** Print Game Board **\n\n"
slate_sliders.print_game_board
puts
puts "** Inner Game Board **\n\n"
#pp slate_sliders.inner_game_board

# puts
# puts "** SOLUTION BOARD **\n\n"

#slate_sliders.timer

tick = 0

slate_sliders.inner_game_board


update do
  if tick % 60 == 0
    slate_sliders.print_game_board
    slate_sliders.current_game_board
  end
  tick += 1
end

on :key_down do |event|
    if event.key == 's'
      slate_sliders.make_move('up')
      clear
      #slate_sliders.inner_game_board
      slate_sliders.print_game_board
    end

    if event.key == 'w'
        slate_sliders.make_move('down')
        clear
        #slate_sliders.inner_game_board
        slate_sliders.print_game_board
    end

    if event.key == 'd'
        slate_sliders.make_move('left')
        clear
        #slate_sliders.inner_game_board
        slate_sliders.print_game_board
    end

    if event.key == 'a'
        slate_sliders.make_move('right')
        clear
        #slate_sliders.inner_game_board
        slate_sliders.print_game_board
    end


end


puts
puts "** Current Position Of Blank Slate **\n\n"
# pp slate_sliders.blank_slate_position

show
