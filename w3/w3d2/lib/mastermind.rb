class Code
  attr_reader :pegs
  
  PEGS = { 'r' => :red, 'g' => :green, 'b' => :blue, 'y' => :yellow,
          'o' => :orange, 'p' => :purple }
  
  def initialize(pegs)
    raise unless pegs.is_a? Array
    @pegs = pegs
  end
  
  def self.random 
    random = []
    4.times {random << PEGS.keys.sample}
    Code.new(random)
  end
  
  def self.parse(input)
    peg_list = input.downcase.split("")
    peg_list.each { |item| raise if !(PEGS.keys.include?(item)) }
    Code.new(peg_list)
  end
  
  def [](index)
    @pegs[index]
  end
  
  def ==(guess)
    return false if guess.class != Code
    exact_matches(guess) == 4
  end
  
  def matches(code)
    match = []
    exact_matches(code).times {match << 'x'}
    near_matches(code).times {match << 'o'}
    match
  end
  
  def exact_matches(code)
    count = 0
    (0..3).each do |x| 
      count += 1 if self[x] == code[x]
    end
    count
  end
  
  def near_matches(code)
    secret = {}
    self.pegs.uniq.each{|e| secret[e]= self.pegs.count(e)}
    guess = {}
    code.pegs.uniq.each{|e| guess[e]= code.pegs.count(e)}
    count = 0
    guess.each do |key, value|
      if secret[key] != nil && secret[key] > value 
        count += value
      else
        count += (secret[key] == nil) ? 0 : secret[key]
      end
    end
    count - self.exact_matches(code)
  end
  
end

class Game
  attr_reader :secret_code, :guess, :turn
  
  def initialize(secret_code = Code.random)
    @secret_code = secret_code
    @board = Board.new
    @turn = 1
  end
  
  def get_guess
    puts "Please Enter your input the following format: rgby \n" +
           "Colors: (R)ed, (G)reen, (B)lue, (Y)ellow, (O)range, (P)urple"
    Code.parse($stdin.gets.chomp)
  end
  
  def display_matches(code)
    puts "exact maches"
    puts secret_code.exact_matches(code)
    puts "near matches"
    puts secret_code.near_matches(code)
  end
  
  def play
    puts "-----------------------------------------------"
    puts "            WELCOME TO MASTERMIND              "
    puts "-----------------------------------------------"
    loop do 
      @guess = get_guess
      matches = @secret_code.matches(guess)
      @board.add_turn_to_board(@turn, @guess.pegs, matches)
      @board.render(self)
      break if matches == ['x', 'x', 'x', 'x'] || @turn == 10
      puts "Response Notes: \n" + 
           "\'x\' is a right color in the right place \n" + 
           "\'o\' is a right color in the wrong place \n"
      @turn += 1
    end
    puts "    #{@board.render_arr(@secret_code.pegs)} - Secret Code"
    winner ? (puts "You Win!") : (puts "You Suck at this!")
  end
  
  def winner
     @secret_code.matches(@guess) == ['x', 'x', 'x', 'x']
  end
  
end

class Board
  attr_accessor :state
  
  def initialize
    @state = {}
  end
  
  def add_turn_to_board(turn, guess, match)
    @state[turn] = [guess, match]
  end
  
  def render(game)
    puts "-----------------------------------------------"
    puts "                   Board                       "
    puts "-----------------------------------------------"
    puts "           guess         |       response      "
    puts "-----------------------------------------------"
    @state.each do |round, value|
      formated_num = round < 10 ? "0#{round}" : round
      puts "#{formated_num}: #{render_arr(value[0])} - #{render_arr(value[1])}"
    end
    puts "-----------------------------------------------"
  end
  
  def render_arr(arr)
    str = ""
    arr.each do |item|
      str << "  #{item}  "
    end
    str
  end
  
end

if __FILE__ == $PROGRAM_NAME
  Game.new.play
end