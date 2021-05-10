class Slates

  attr_accessor :x, :y, :colour

  def initialize(x, y)
    index_positions={}
    @x = index_positions[:x] || x
    @y = index_positions[:y] || y
    @colour = colour
  end
  
  def colour
    board_colours = {
      1 => "green", 2 => "red", 3 => "blue",
      4 => "orange", 5 => "yellow", 6 => "white"
    }

    if @x == 2 && @y == 2
      "blank"
    else
      case rand(1..6)
      when 1
        "#{board_colours[1]}"
      when 2
        "#{board_colours[2]}"
      when 3
        "#{board_colours[3]}"
      when 4
        "#{board_colours[4]}"
      when 5
        "#{board_colours[5]}"
      when 6
        "#{board_colours[6]}"
      end
    end
  end

end