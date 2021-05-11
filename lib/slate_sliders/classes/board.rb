class Board

  #attr_reader :board

  

  def initialize
    @size = 5
    @board = startup_all_slates
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
    board = Array.new(@size)

    @size.times do |column_index|
      board[column_index] = Array.new(@size)
      @size.times do |row_index|
        board[column_index][row_index] = Slates.new(row_index, column_index)
      end
    end

    board
  end

  # def print_board
  #   output = "      0      1      2      3      4"
  #   @slates.each.with_index do |row, index|
  #     output += "\n #{index} "
  #     row.each do |slate|
  #       output += slate.to_string
  #     end
  #   end
  #
  #   puts output
  #
  #   return
  # end
  
  # def target_pattern
  #   nil
  # end

  def timer
    max_time_min = 2 # time in minutes
    max_time_sec = Time.now + max_time_min.to_i*60

    while Time.now <= max_time_sec
      sleep 1

      t = max_time_sec - Time.now
      min, sec = t/60, t%60
      print "\b"*5
      printf "%02d:%02d", min, sec if t > 0

    end
  end

end