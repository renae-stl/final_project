class Board

  #attr_reader :board

  

  def initialize
    @size = 5
  end

  def start_screen
    puts
    puts "-" * 16
    puts ' Slate! Sliders '
    puts "-" * 16
    puts
    puts '@ 2021 Team Earth'
    puts
  end

  def startup_all_slates
    @board = Array.new(@size)
    @print_board = Array.new

    @size.times do |column_index|
      @board[column_index] = Array.new(@size)
      @size.times do |row_index|
        @board[column_index][row_index] = Slates.new(row_index, column_index)
        @print_board.push(@board[column_index][row_index].instance_variable_get(:@colour).slice(0..2))
      end
    end

    @board
  end

  def print_board
    @print_board_2d = @print_board.each_slice(@size).to_a.transpose

    @print_board_2d.each do |arr|
      arr.each do |colour|
        print "[ #{colour} ] "
      end
      print "\n"
    end
  end

  def target_pattern
    slate = @print_board_2d

    outer_slates = [slate[0][0], slate[0][1], slate[0][2], slate[0][3], slate[0][4],
                    slate[1][0],                                        slate[1][4],
                    slate[2][0],                                        slate[2][4],
                    slate[3][0],                                        slate[3][4],
                    slate[4][0], slate[4][1], slate[4][2], slate[4][3], slate[4][4],
    ]

    target_pattern = [[slate[1][1], slate[1][2], slate[1][3]],
                      [slate[2][1], outer_slates.sample, slate[2][3]],
                      [slate[3][1], slate[3][2], slate[3][3]],
    ]

    target_pattern.shuffle! # target pattern shuffled
  end

  def print_inner_board(inner_board_2d)
    inner_board_2d.each do |arr|
      arr.each do |colour|
        print "[ #{colour} ] "
      end
      print "\n"
    end
  end

  def timer
    nil
  end

  def timer_slider
    nil
  end

end