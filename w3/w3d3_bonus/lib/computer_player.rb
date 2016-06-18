class ComputerPlayer
  attr_accessor :board
  
  def initialize
      @board = Board.new
  end
  
  def get_play(opponent)
    possible_moves = opponent.board.avalibe_spaces +
                    opponent.board.hidden_ships
    possible_moves.sample
  end
  
  def place_ships
    directions = ["up", "down", "left", "right"]
    location = ""
    @board.pieceset.ships.each do |name, ship|
      loop do 
        start = @board.avalibe_spaces.sample
        direction = directions.sample
        location = @board.get_location(direction, start, ship.length)
        break if @board.move_is_valid?(location)
      end
      @board.place_ship_at(location)
      @board.pieceset.ships[name] = location
      @board.find_hidden_ships
    end
  end
    
  def see_status
  end
    
end
