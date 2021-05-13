#!/usr/bin/env ruby
require 'ruby2d'
require_relative 'classes/board'
require_relative 'classes/slates'
require_relative 'classes/game'

slate_sliders = Board.new

set( { 
    :title => 'Slate Sliders!' ,
    :background => '#0E1619',
    :width => 626,
    :height => 670,
} )

tick = 0

update do
  if tick % 60 == 0
    slate_sliders.print_game_board
  end
  tick += 1
end

on :key_down do |event|
    if event.key == 's'
      slate_sliders.make_move('up') && slate_sliders.is_move_valid?('up')
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
on :mouse_down do
    Window.clear
    slate_sliders.inner_game_board
    #slate_sliders.solution_board
end
#show

p slate_sliders.startup_game_board
p slate_sliders.is_move_valid?("up")
