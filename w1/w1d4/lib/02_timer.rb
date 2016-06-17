class Timer
  attr_accessor :seconds
  
  def initialize 
    @seconds = 0
  end
  
  def time_string
    hour = formated_to_two_digits(@seconds / 60 / 60)
    min = formated_to_two_digits(@seconds / 60 % 60)
    sec = formated_to_two_digits(@seconds % 60)
    
    hour + ":" + min + ":" + sec 
  end
  
  def formated_to_two_digits(num)
    return num < 10 ? "0#{num}" : num.to_s
  end

end
