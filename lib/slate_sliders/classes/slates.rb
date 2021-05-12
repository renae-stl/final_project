class Slates

  attr_accessor :x, :y, :colour
  attr_reader :selected_slate


  def initialize(x, y)
    @x = x
    @y = y
    @colour = get_startup_colour
    @selected_slate = false
  end

  # the default starting pattern of the game
  def get_startup_colour
    if @y <= 1
      if @x <= 1
        return "red"
      elsif @x == 2
        return "yellow"
      elsif @x >= 3
        return "blue"
      end
    elsif @y == 2
      if @x <= 1
        return "white"
      elsif @x == 2
        return "black"
      elsif @x >= 3
        return "white"
      end
    elsif @y >= 3
      if @x <= 1
        return "orange"
      elsif @x == 2
        return "yellow"
      elsif @x >= 3
        return "green"
      end
    end

    raise "Invalid Index!"
  end

  def select
    @selected_slate = true
  end
  
  def unselect
    @selected_slate = false
  end

  def to_string 
    "[ #{@colour.slice(0,3)} ]"
  end

end