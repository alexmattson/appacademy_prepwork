require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_accessor :player_one, :player_two, :board, :current_player
  
  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @board = Board.new
    @current_player = player_one
  end
  
  def switch_players!
    @current_player = @current_player == @player_one ? @player_two : @player_one
  end
  
  def play_turn
    @current_player.display(@board)
    move = false
    loop do 
      move = @current_player.get_move
      break if @board.empty?(move) != false
      space_taken
    end
    @board.place_mark(move, @current_player.mark)
    @board.avalible_positions.delete(move)
  end
  
  def play
    set_markers
    loop do
      play_turn
      break if @board.over?
      switch_players!
    end
    puts "#{@board.winner} wins!"
  end
  
  def set_markers
    @player_one.mark = :X
    @player_two.mark = :O
  end
  
  private
  
  #errors
  
  def space_taken
    puts "That Space is already taken choose another."
  end
    
end

Game.new(HumanPlayer.new("alex"), ComputerPlayer.new("comp")).play