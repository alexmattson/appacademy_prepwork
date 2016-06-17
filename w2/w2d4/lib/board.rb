class Board
  attr_accessor :grid, :avalible_positions
  
  def initialize(grid = Array.new(3) {Array.new(3, nil)})
    @grid = grid
    @avalible_positions = [[0,0], [0,1], [0,2],
                           [1,0], [1,1], [1,2],
                           [2,0], [2,1], [2,2]]
    @turns = []
  end
  
  def place_mark(pos, mark)
    @turns << mark
    if self.empty?(pos) || mark == nil
      self[*pos] = mark
      winner if self.over?
    else
      puts "That space is already taken"
    end
  end
  
  def empty?(pos)
    self[*pos] == nil
  end
  
  def winner
    self.over? ? @turns[-1] : nil
  end 
  
  def check_rows
    @grid.each { |row| return true if (row.count(:X) == 3 || row.count(:O) == 3) }
    false
  end
  
  def check_columns
    (0..2).each do |column| 
      return true if self[0, column] == self[1, column] && 
                     self[0, column] == self[2, column] &&
                     self[0, column] != nil
    end
    false
  end
  
  def check_diag
    return true if self[0, 0] == self[1, 1] && 
                   self[0, 0] == self[2, 2] &&
                   self[0, 0] != nil
    return true if self[0, 2] == self[1, 1] && 
                   self[0, 2] == self[2, 0] &&
                   self[0, 2] != nil
    false
  end
  
  def over?
    return true if check_rows || check_columns || check_diag
    (0..2).each {|row| (return false) if @grid[row].include?(nil)}
    @turns << nil
    true
  end
  
  def [](row, col)
    @grid[row][col]
  end

  def []=(row, col, mark)
    @grid[row][col] = mark
  end
  
end
