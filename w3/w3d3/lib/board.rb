class Board
    attr_accessor :grid, :avalibe_spaces, :hidden_ships
    
    def initialize(grid = self.class.default_grid)
        @grid = grid
        @avalibe_spaces = create_indexes
        @hidden_ships = []
    end
    
    def self.default_grid
        Array.new(10) { Array.new(10, nil) }
    end
    
    def create_indexes
      double_iterate {|indexes, i, j| indexes << [i,j]}
    end
    
    def find_hidden_ships
      double_iterate(@hidden_ships) do |ships, i, j| 
        ships << [i,j] if !(self.empty?([i,j]))
      end
    end
    
    def count
      count = 0
      self.grid.flatten.each { |space| count += 1 if space == :s }
      count
    end
    
    def place_random_ship
        raise if self.full?
        space = @avalibe_spaces.sample
        self[*space] = :s
        avalibe_spaces.delete(space)
    end
    
    def populate_grid
    end
    
    #render methods
    def display
      header = "   |"
      (0..@grid.length - 1).each {|x| header << " #{x} |"}
      puts header 
      puts grid_to_s
    end
    
    def grid_to_s
      str = ""
      str << horizontal_line
      
      i = 0
      @grid.each do |row|
        j = 0
        str << side_column(i)
        row.each do |space|
          str << square([i, j], space)
          j += 1
        end
        str << horizontal_line(true)
        i+=1
      end
      str
    end
    
    def side_column(indx)
      " #{indx} |"
    end 
    
    def square(indexes, space)
      s = space
      s = nil if @hidden_ships.include?(indexes)
      s == nil ?  "   |" :  " #{space} |" 
    end
    
    def horizontal_line(new_line = false)
      str = new_line ? "\n---|" : "---|"
      @grid[0].each { str << "---|"}; str << "\n"
      str
    end
    
    # Boolean methods
    def empty?(pos = nil)
        return !(@grid.flatten(1).include?(:s)) if pos == nil
        self[*pos] == nil
    end
    
    def full?
        !grid.flatten.include?(nil)
    end
    
    def won?
       @hidden_ships.length == 0
    end
    
    def hit?(pos)
      @hidden_ships.include?(pos)
    end
    
    #helper methods
    def [](row, col)
      @grid[row][col]
    end
    
    def []=(row, col, mark)
      @grid[row][col] = mark
    end
    
    def double_iterate(arr = [], &blc)
      i = 0
      @grid.each do |row|
          j = 0
          row.each do |space|
              yield(arr,i,j, *[row,space])
              j += 1
          end
          i += 1
      end
      arr
    end
    
end
