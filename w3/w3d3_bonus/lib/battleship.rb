require_relative 'board'
require_relative 'player'
require_relative 'computer_player'

class BattleshipGame
  attr_reader :player1, :player2
  
  def initialize(player1 = HumanPlayer.new, player2 = ComputerPlayer.new)
      @player1 = player1
      @player2 = player2
      @previous_round = [nil, nil]
  end
  
  def play
    setup
    # If you want to Cheat uncomment next line 
    # puts @player2.board.hidden_ships.to_s + " - Opponets positions"
    loop do
      play_turn(@player1, @player2, 0)
      (puts "The Fleet is Destroyed! Player1 Wins!"; break) if @player2.board.won?
      play_turn(@player2, @player1, 1)
      (puts "The Fleet is Destroyed! Player2 Wins!"; break) if @player1.board.won?
    end
  end
  
  def attack(player, pos)
      player.board[*pos] = :x if player.board[*pos] == nil
      player.board.hidden_ships.delete(pos) if player.board[*pos] == :s
      player.board.pieceset.change_state(pos) if player.board[*pos] == :s
      player.board.avalibe_spaces.delete(pos)
  end
  
  
  def count
    @board.count
  end
      
  def game_over?
    @board.won?
  end
  
  def play_turn(player, opponent, i)
    name = player1_equal?(player) ? "Player1" : "Player2"
    display_your_board(player)
    display_opponets_board(player, opponent)
    display_previous_round(player)
    player.see_status
    move = player.get_play(opponent)
    @previous_round[i] = opponent.board.hit?(move) ? "#{name} Hit at #{move}!" : 
                                                     "#{name} Missed at #{move}"
    attack(opponent, move)
  end
  
  def player1_equal?(player)
    @player1 == player
  end
  
  def setup
    @player1.place_ships
    @player2.place_ships
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
  
  def display_previous_round(player)
    puts @previous_round[0] if @previous_round[0] != nil && player.class != ComputerPlayer
    puts @previous_round[1] if @previous_round[1] != nil && player.class != ComputerPlayer
  end
  
end

if __FILE__ == $PROGRAM_NAME
  BattleshipGame.new.play
end

