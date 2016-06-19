require_relative 'human'
require_relative 'computer'

class Hangman
  attr_reader :guesser, :referee, :board
  
  def initialize(players = {referee: ComputerPlayer.new, 
                            guesser: HumanPlayer.new})
    @referee = players[:referee]
    @guesser = players[:guesser]
    @board = []
  end
  
  #board handling
  def setup
    length = @referee.pick_secret_word
    @guesser.register_secret_length(length)
    set_board(length)
  end
  
  def set_board(length)
    (0..length - 1).each {@board << "-"}
  end
  
  def update_board(correct, guess)
    correct.each {|i| @board[i] = guess}
  end
  
  def display
    puts "Secret Word: " + @board.join("")
  end
  
  #play
  def take_turn
    display if @guesser.class == HumanPlayer
    guess = @guesser.guess(board)
    response = @referee.check_guess(guess, board)
    update_board(response, guess)
    @guesser.handle_response(guess, response)
  end
  
  def play
    setup
    loop do 
      take_turn
      break if won?
    end
    puts "The Hangman is saved! The word was '#{@board.join("")}'"
  end
  
  #booleans
  def won?
    !@board.include?('-')
  end
    
end
