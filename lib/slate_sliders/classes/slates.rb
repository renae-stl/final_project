class Slates

  attr_accessor :x, :y, :colour
  attr_reader :selected_slate

  def initialize(x, y)
    @x = x
    @y = y
    @colour = get_startup_colour
    @selected_slate = false
  end

  def get_startup_colour
    if @y <= 1
      helper(@x,"red", "yellow", "blue")
    elsif @y == 2
      helper(@x,"white", "black", "white")
    elsif @y >= 3
      helper(@x,"orange", "yellow", "green")
    end

    raise "Invalid Index!"
  end

  def helper(x_pos, colour1, colour2, colour3)
    if x_pos <= 1
      colour1
    elsif x_pos == 2
      colour2
    elsif x_pos >= 3
      colour3
    end
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