class ComputerPlayer
  attr_accessor :name, :board, :mark
  
  def initialize(name)
    @name = name
    @mark = nil
    @board = Board.new
  end
  
  def display(board)
    @board = board
  end
  
  def get_move
    winning = winning_move
    if winning != false
      winning
    else 
      @board.avalible_positions.sample
    end
  end
  
  def winning_move
    @board.avalible_positions.each do |move|
      @board.place_mark(move, @mark)
      if @board.over?
        @board.place_mark(move, nil)
        return move
      end
      @board.place_mark(move, nil)
    end
    false
  end
  
end
