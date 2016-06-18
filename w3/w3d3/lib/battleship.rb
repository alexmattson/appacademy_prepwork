require_relative 'board'
require_relative 'player'

class BattleshipGame
  attr_reader :board, :player
  
  def initialize(player, board)
      @player = player
      @board = board
  end
  
  def play
    setup
    @board.display
    loop do
      play_turn
      @board.display
      break if @board.won?
    end
  end
  
  def attack(pos)
      @board[*pos] = :x if @board[*pos] == nil
      @board.hidden_ships.delete(pos) if @board[*pos] == :s
      @board.avalibe_spaces.delete(pos)
  end
  
  def count
    @board.count
  end
      
  def game_over?
    @board.won?
  end
  
  def play_turn
    move = @player.get_play(@board)
    puts (@board.hit?(move) ? "You Hit!" : "Miss")
    attack(move)
  end
  
  def display_status
  
  end
  
  def setup
    (0..9).each {@board.place_random_ship}
    @board.find_hidden_ships
  end
  
end


BattleshipGame.new(HumanPlayer.new, Board.new).play