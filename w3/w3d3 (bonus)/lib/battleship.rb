require_relative 'board'
require_relative 'player'
require_relative 'computer_player'

class BattleshipGame
  attr_reader :player1, :player2
  
  def initialize(player1 = HumanPlayer.new, player2 = ComputerPlayer.new)
      @player1 = player1
      @player2 = player2
  end
  
  def play
    setup
    # Debugging #
    puts @player2.board.hidden_ships.to_s + " - Opponets positions"
    #############
    loop do
      player1_turn
      (puts "Player1 Wins!"; break) if @player2.board.won?
      player2_turn
      (puts "Player2 Wins!"; break) if @player1.board.won?
    end
  end
  
  def attack(player, pos)
      player.board[*pos] = :x if player.board[*pos] == nil
      player.board.hidden_ships.delete(pos) if player.board[*pos] == :s
      player.board.avalibe_spaces.delete(pos)
  end
  
  def count
    @board.count
  end
      
  def game_over?
    @board.won?
  end
  
  def player1_turn
    display_your_board(@player1)
    display_opponets_board(@player1, @player2)
    move = @player1.get_play(@player2)
    puts (@player2.board.hit?(move) ? "Player1 Hit!" : "Player1 Missed")
    attack(@player2, move)
  end
  
  def player2_turn
    display_your_board(@player2)
    display_opponets_board(@player2, @player1)
    move = @player2.get_play(@player1)
    puts (@player1.board.hit?(move) ? "Player2 Hit!" : "Player2 Missed")
    attack(@player1, move)
  end
  
  def display_status
  
  end
  
  def setup
    @player1.board.display;@player1.place_ships
    (0..0).each {@player2.place_ship}
    @player1.board.find_hidden_ships
    @player2.board.find_hidden_ships
  end
  
  def display_your_board(player)
    unless player.class == ComputerPlayer
      puts "--------------------------------------------"
      puts "                Your Board                  "
      puts "--------------------------------------------"
      player.board.display(true) 
    end
  end
  
  def display_opponets_board(player, opponent)
    unless player.class == ComputerPlayer
      puts "--------------------------------------------"
      puts "          Your Opponent's Board             "
      puts "--------------------------------------------"
      opponent.board.display 
    end
  end
  
end

# if __FILE__ == $PROGRAM_NAME
#   BattleshipGame.new.play
# end

game = BattleshipGame.new
game.play
# puts game.board.hidden_ships.to_s
