class Slates

  def initialize(x, y)
    index_positions={}
    @x = index_positions[:x] || x
    @y = index_positions[:y] || y
    @colour = colours
  end
  
  def colours
    board_colours = {
      1 => "Gre", 2 => "Red", 3 => "Blu",
      4 => "Ora", 5 => "Yel", 6 => "Whi"
    }

    if @x == 2 && @y == 2
      "[ BLA ]"
    else
      case rand(1..6)
      when 1
        "[ #{board_colours[1]} ]"
      when 2
        "[ #{board_colours[2]} ]"
      when 3
        "[ #{board_colours[3]} ]"
      when 4
        "[ #{board_colours[4]} ]"
      when 5
        "[ #{board_colours[5]} ]"
      when 6
        "[ #{board_colours[6]} ]"
      end
    end
  end

end