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
  if event.key == 'up' || event.key == 'down' ||
     event.key == 'left' || event.key == 'right'

    slate_sliders.make_move(event.key) if slate_sliders.is_move_valid?(event.key)
    slate_sliders.print_game_board
  end
end

on :mouse_down do
    Window.clear
    slate_sliders.inner_game_board
    #slate_sliders.solution_board
end
show

#&& slate_sliders.is_move_valid?('up')