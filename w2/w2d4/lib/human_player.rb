class HumanPlayer
  attr_accessor :name, :mark
  
  def initialize(name)
    @name = name
    @mark = nil
  end
  
  def display(board)
    puts board.grid[0].to_s
    puts board.grid[1].to_s
    puts board.grid[2].to_s
  end
  
  def get_move
    puts "Where do you want to move? enter as: row, column"
    move = gets.chomp
    move.split(",").map!{|x| x.to_i}
  end
end
