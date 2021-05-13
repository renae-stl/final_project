#!/usr/bin/env ruby
require 'ruby2d'
require_relative 'classes/board'
require_relative 'classes/slates'
require_relative 'classes/game'

slate_sliders = Board.new
set( { 
    :title => 'Slate Sliders!' ,
    :background => 'orange',
    :width => 600,
    :height => 600,
    :background => '#0E1619',
} )
@game_started = false
mouse_coordinate_x = Window.mouse_x
mouse_coordinate_y = Window.mouse_y


Image.new(
    "./resources/images/SlateSliders.png",
    x: 150, y: 0,
    width: 300, height: 300,
)

Image.new(
    "./resources/images/play_button.png",
    x: 200, y: 350,
    width: 200, height: 100,
)


on :mouse_down do
    if Window.mouse_x.between?(200, 400) && Window.mouse_y.between?(350, 450)
        @game_started = true
        Window.clear
        puts "game started = #{@game_started}"
        set( { 
        :background => 'green',
    } )


    music = Music.new('./resources/music/Kid_Icarus_Uprising_Black_Feathers_in_the_Sky_OC_ReMix.mp3')
    music.play
    music.volume = 30

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
        slate_sliders.target_game_board
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


    puts
    puts "** Current Position Of Blank Slate **\n\n"
    # pp slate_sliders.blank_slate_position
    end
end


=======


show

#&& slate_sliders.is_move_valid?('up')