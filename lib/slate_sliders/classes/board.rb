class Board

  def initialize
    @size = 5
  end

  def start_screen
    puts "-" * 16
    puts ' Slate! Sliders '
    puts "-" * 16
    puts
    puts '@ 2021 Team Earth'
    puts
  end

  def slates
    @board = Array.new(@size)
    @size.times do |column_index|
      @board[column_index] = Array.new(@size)
      @size.times do |row_index|
        @board[column_index][row_index] = Slates.new(row_index, column_index)
      end
    end
    @board
  end

  def target_pattern
    constant = @board

    random_slate = [constant[0][0], constant[0][1], constant[0][2], constant[0][3], constant[0][4],
                    constant[1][0],                                                 constant[1][4],
                    constant[2][0],                                                 constant[2][4],
                    constant[3][0],                                                 constant[3][4],
                    constant[4][0], constant[4][1], constant[4][2], constant[4][3], constant[4][4],
                   ]
    
    
    target = [[constant[1][1], constant[1][2], constant[1][3]],
              [constant[2][1], random_slate.sample,   constant[2][3]],
              [constant[3][1], constant[3][2], constant[3][3]],
             ]
    target.shuffle!
  end

  # target_pattern - which will solve the puzzle
  # initial_board_pattern
  # current_board_pattern
  def print_board

  end

  def timer
    nil
  end

  def timer_slider
    nil
  end
  
end