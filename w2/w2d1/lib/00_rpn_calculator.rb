class RPNCalculator
  
  #stack
  def initialize
    @stack = []
  end
  
  #stack modification
  def push(num)
    @stack.push(num)
  end
  
  def plus
    self.check_number_of_values
    @stack.push(:+)
  end
  
  def minus
    self.check_number_of_values
    @stack.push(:-)
  end
  
  def times
    self.check_number_of_values
    @stack.push(:*)
  end
  
  def divide
    self.check_number_of_values
    @stack.push(:/)
  end
  
  #calculation and opperations
  def value
    i = 0
    while i < @stack.length
      if @stack[i] == :+ then opperation(i, @stack[i]); i = 0 end 
      if @stack[i] == :- then opperation(i, @stack[i]); i = 0 end 
      if @stack[i] == :* then opperation(i, @stack[i]); i = 0 end 
      if @stack[i] == :/ then opperation(i, @stack[i]); i = 0 end 
      i+=1
    end
    @stack[-1]
  end
  
  def opperation(i, opp)
    math = @stack[i - 2].to_f.send(opp, @stack[i - 1].to_f)
    @stack.slice!(i - 2..i)
    @stack.insert(i - 2, math)
  end
  
  #outputs
  def tokens(str)
    @stack = str.split(" ")
    @stack.map! do |x|
      if x == '+' then x = :+ 
      elsif x == '-' then x = :- 
      elsif x == '*' then x = :*  
      elsif x == '/' then x= :/ 
      else x.to_i end
    end
  end
  
  def evaluate(str)
    @stack = self.tokens(str)
    self.value
  end
  
  #errors
  def check_number_of_values
    raise "calculator is empty" if @stack.length < 2
  end
  
end

# Command Line Code

if __FILE__ == $PROGRAM_NAME
  stack = RPNCalculator.new
  
  if ARGV.empty?
    str = ""
    loop do
      input = gets.chomp
      (puts stack.evaluate(str); break) if input == "" 
      str += "#{input.to_s} "
    end
  else
    File.foreach(ARGV[0]) do |f|
      puts stack.evaluate(f)
    end
  end
end