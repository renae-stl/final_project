class Slates

  attr_accessor :x_pos, :y_pos, :colour
  attr_reader :selected_slate

  def initialize(x_pos, y_pos)
    @x_pos = x_pos
    @y_pos = y_pos
    @colour = get_startup_colour
    @selected_slate = false
  end

  def get_startup_colour
    if @y_pos <= 1
      return row_colours(@x_pos, '#EE6055', '#60D394', '#AAF683')
    elsif @y_pos == 2
      return row_colours(@x_pos, 'white', '#0E1619', 'white')
    elsif @y_pos >= 3
      return row_colours(@x_pos, '#FF9B85', '#60D394', '#FFD97D')
    end

    raise 'Invalid Index!'
  end

  def row_colours(x_pos, colour1, colour2, colour3)
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

end