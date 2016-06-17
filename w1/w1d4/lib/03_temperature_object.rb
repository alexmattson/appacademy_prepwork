class Temperature
  attr_accessor :temp
  
  # initially converst everything to fahrenheit as a 
  # base line to work with
  def initialize(temp)
    @temp = initial_convert_to_f(temp)
  end
  
  def self.from_fahrenheit(deg)
    self.new(f: deg)
  end
  
  def self.from_celsius(deg)
    self.new(c: deg)
  end
  
  def in_fahrenheit
    @temp
  end
  
  def in_celsius
    ftoc(@temp)
  end
  
  def ftoc(deg)
    ( deg - 32.0 ) * ( 5.0 / 9.0 )
  end
  
  def ctof(deg)
    (32.0 + ((9.0 / 5.0) * deg))
  end
  
  def initial_convert_to_f(temp)
    temp.keys[0] == :c ? ctof(temp.values[0]) : temp.values[0]
  end
end

class Celsius < Temperature 
  def initialize(temp)
    @temp = initial_convert_to_f({c: temp})
  end
end

class Fahrenheit < Temperature
  def initialize(temp)
    @temp = temp
  end
end