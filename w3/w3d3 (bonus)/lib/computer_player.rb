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
    
    def place_ship
        @board.place_random_ship
    end
    
end
