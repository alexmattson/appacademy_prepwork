class Code
  attr_reader :pegs, :colors
  
  def initialize
    @colors = ['R', 'G', 'B', 'Y', 'O', 'P']
    @pegs = random
  end
  
  def random 
    random = []
    4.times {random << @colors.sample}
    random
  end
  
  def parse(input)
    @pegs = input.upcase.split("")
  end
  
  def matches(game)
    match = []
    exact_matches(game).times {match << 'x'}
    near_matches(game).times {match << 'o'}
    match
  end
  
  def exact_matches(game)
    count = 0
    j = 0
    game.guess.pegs.each do |x| 
      if game.secret_code.include?(x) &&
         game.secret_code.each_index.select{|i| game.secret_code[i] == x}.include?(j)
        count += 1
      end
      j+=1
    end
    count
  end
  
  def near_matches(game)
    secret = {}
    game.secret_code.uniq.each{|e| secret[e]= game.secret_code.count(e)}
    guess = {}
    game.guess.pegs.uniq.each{|e| guess[e]= game.guess.pegs.count(e)}
    count = 0
    guess.each do |key, value|
      if secret[key] != nil && secret[key] > value 
        count += value
      else
        up = secret[key] == nil ? 0 : secret[key]
        count += up
      end
    end
    count - exact_matches(game)
  end
  
end

class Game
  attr_reader :secret_code, :guess, :turn
  
  def initialize
    @secret_code = Code.new.pegs
    @guess = Code.new
    @board = Board.new
    @turn = 1
  end
  
  def play
    loop do 
      puts "Please Enter your input the following format: RGBY" +
           " - (R)ed, (G)reen, (B)lue, (Y)ellow, (O)range, (P)urple"
      @guess.parse(gets.chomp)
      matches = @guess.matches(self)
      @board.add_turn_to_board(@turn, @guess.pegs, matches)
      @board.render(self)
      break if matches == ['x', 'x', 'x', 'x'] || @turn == 10
      puts "Response Notes: \n" + 
           "\'x\' is a right color in the right place \n" + 
           "\'o\' is a right color in the wrong place \n"
      @turn += 1
    end
    puts "    #{@board.render_arr(@secret_code)} - Secret Code"
    winner ? (puts "You Win!") : (puts "You Suck at this!")
  end
  
  def winner
    @guess.matches(self) == ['x', 'x', 'x', 'x']
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
      formated_num = game.turn < 10 ? "0#{round}" : round
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
