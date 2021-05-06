require 'ruby2d'

tick = 0

update do
  if tick % 60 == 0
    set background: 'random'
  end
  tick += 1
end

set title: 'Speed tiles!'



Square.new(
  x1: 320, y1: 50,
  x2: 540, y2: 430,
  x3: 100, y3: 430,
  x4: 520, y4: 50,
  color: ['red', 'green', 'blue', 'yellow']
)

show

# class Board
#   def print_status
      
#   end

#   def print_board
      
#   end


# end