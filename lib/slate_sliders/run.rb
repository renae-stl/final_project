#!/usr/bin/env ruby
require 'ruby2d'
require_relative 'classes/board'
require_relative 'classes/slates'

slate_sliders = Board.new
solution_board = Board.new
solution_board.generate_solution_board

# Window display settings

set title: 'Slate Sliders!',
    width: 600,
    height: 600,
    background: '#0E1619'

Window.mouse_x
Window.mouse_y

Image.new(
  './resources/images/slate_sliders.png',
  x: 150, y: 0,
  width: 300, height: 300
)

Image.new(
  './resources/images/play_button.png',
  x: 200, y: 350,
  width: 200, height: 100
)

on :mouse_down do
    if Window.mouse_x.between?(200, 400) && Window.mouse_y.between?(350, 450)
        Window.clear
        set background: '#0E1619'

        music = Music.new('./resources/music/game_music.mp3')
        music.play
        music.volume = 5

        tick = 0
        update do
            if tick % 60 == 0
                slate_sliders.print_game_board
                solution_board.target_pattern
            end

            tick += 1
        end

        Image.new(
          './resources/images/slate_sliders.png',
          x: 218, y: 18,
          width: 150, height: 75,
          z: 3
        )

        Image.new(
          './resources/images/close_button.png',
          x: 10, y: 13,
          width: 75, height: 75,
          z: 3
        )

        on :key_down do |event|
            if event.key == 'up' || event.key == 'down' ||
                event.key == 'left' || event.key == 'right'

                slate_sliders.make_move(event.key) if slate_sliders.is_move_valid?(event.key)
                slate_sliders.print_game_board

                if slate_sliders.same_inner_board?(solution_board)
                    Image.new(
                      './resources/images/winner.png',
                      x: 150, y: 5,
                      width: 350, height: 300,
                      z: 3
                    )
                end

                on :mouse_down do
                    if Window.mouse_x.between?(10, 12) && Window.mouse_y.between?(13, 15)
                        Window.close
                    end
                end
            end
        end
    end
end

# Show the window
show
