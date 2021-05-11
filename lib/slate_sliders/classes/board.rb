require_relative 'slates'
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

  def print_board
    output = "      0      1      2      3      4"
    @board.each.with_index do |row, index|
      output += "\n #{index} "
      row.each do |slate|
        output += slate.to_string
      end
    end
  
    puts output
  
    return
  end
  
  def target_pattern
    output = "      0      1      2      3      4"
    @inner_slates.each.with_index do |row, index|
      output += "\n #{index} "
      row.each do |slate|
        output += slate.to_string
      end
    end
  
    puts output
  
    return
  end


  def truncate_edges
    # Remove outer edges of the tiles
    # Remove anything where y = 0, x = 0, y = 4, x = 4
    
    @inner_slates = @board.map do |row|
      row.select {|slate| !(slate.x == 0 || slate.x == 4 || slate.y == 0 || slate.y == 4) }
    end

    # omit empty rows
    @inner_slates = @inner_slates.reject { |row| row.empty? }

    return @inner_slates
 # map my array so that these values are filtered
  end
 

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