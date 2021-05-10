class Timer

  def initialize()
    @start = Time.now
  end

  def elapsed_time
    now = Time.now
    elapsed = now - @start
    puts 'Timer: ' +  elapsed.to_s + ' seconds'
    elapsed.to_s
  end

end

  s = Timer.new
sleep(2)
puts s.elapsed_time


 # comt = 0
  # while (comt < 10)
  #     sleep(1)
  #     comt = comt +1
  #     puts comt
  # end#while