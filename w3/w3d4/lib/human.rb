class HumanPlayer
  
  def initialize
  end
  
  
  #ref
  def pick_secret_word
    puts "How many letters is your word?"
    gets.chomp.to_i
  end
  
  def check_guess(letter, board)
    puts "Does your word contain '#{letter}'? y/n"
    confirmation = (gets.chomp.strip == 'y')
    chars = []
    if confirmation
      loop do 
        puts "Your word so far is #{board.join("")}"
        puts "What number character(s) are '#{letter}'?"
        puts "i.e. in 'little', 't' is characer 3,4"
        chars = gets.chomp.split(",").map{|x| x.to_i - 1}
        break if space_open_on?(board, chars)
        puts "The character(s) you entered are already taken."
      end
    end
    chars
  end
  
  def space_open_on?(board, chars)
    chars.each { |i| return false if board[i] != "-"}
    true 
  end
  
  #player
  def guess(board)
    puts "Guess a letter"
    gets.chomp
  end
  
  def handle_response(letter, indices)
  end
  
  def register_secret_length(length)
    @secret_length = length
  end
  
  
end