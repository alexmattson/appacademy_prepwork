class Solver
  attr_accessor :maze
  
  def initialize
    @maze = get_maze
    @possible = []
    @best_path = []
  end
  
  #I/O tasks
  def get_maze
    maze = []
    File.foreach(ARGV[0]) do |s| 
      temp = []
      s = s.strip
      (0..s.length - 1).each { |i| temp << s[i]}
      maze << temp
    end
    maze
  end
  
  def output_solution
    input_name = ARGV[0].split(".")[0]
    File.open("#{input_name}-solution.txt", "w") do |f|
      (0..@maze.length - 1).each {|i| f.puts @maze[i].join('')}
    end
  end
  
  
  #solving
  def solve
    start = Time.now
    @start = find("S")
    @finish = find("E")
    sample_algorithm
    draw_solution
    output_solution
    finish = Time.new
    puts finish - start
  end
  
  def sample_algorithm
    @possible = [@finish << 0]
    @possible.each do |point|
      check_adjacent(point)
      break if found_start?
    end 
    gets_best_path
  end
  
  def check_adjacent(point)
    i = point[0]
    j = point[1]
    move = point[2]
    @possible << [i - 1, j,  move + 1] if (@maze[i - 1][j] == " " ||
                                           @maze[i - 1][j] == "S") && 
                                           !already_been_here?([i - 1, j])  
    @possible << [i + 1, j,  move + 1] if (@maze[i + 1][j] == " " ||
                                           @maze[i + 1][j] == "S") && 
                                           !already_been_here?([i + 1, j]) 
    @possible << [i, j - 1,  move + 1] if (@maze[i][j - 1] == " " ||
                                           @maze[i][j - 1] == "S") && 
                                           !already_been_here?([i, j - 1]) 
    @possible << [i, j + 1,  move + 1] if (@maze[i][j + 1] == " " ||
                                           @maze[i][j + 1] == "S") && 
                                           !already_been_here?([i, j + 1]) 
  end
  
  def gets_best_path
    moves = @possible[-1][2]
    @best_path << [*@start, moves]
    @possible.reverse!
    @possible.each do |current|
      last_move = @best_path[-1]
      if is_adjacent?(current, last_move) && (current[2] + 1 == last_move[2])
        @best_path << current
      end
    end
    @best_path.map!{|x| [x[0], x[1]]}
  end
  
  #tasks
  def find(point)
    (0..@maze.length - 1).each do |i|
      (0..@maze[i].length - 1).each do |j|
        return [i, j] if @maze[i][j] == point
      end
    end
  end 
  
  def draw_solution
    line = @best_path.dup
    line.pop
    line.shift
    line.each do |i|
      self[i[0], i[1]] = 'X'
    end
  end
  
  #booleans
  def is_wall?(pos)
   self[*pos] == "*"
  end
  
  def found_start?
    @possible.select{|x| [x[0], x[1]] == @start}.length > 0 
  end
  
  def already_been_here?(point)
    @possible.each do |x|
      return true if x[0] == point[0] && x[1] == point[1]
    end
    false
  end
  
  def is_adjacent?(point1, point2)
    return true if point1[0] == point2[0] && point1[1] + 1 == point2[1]
    return true if point1[0] == point2[0] && point1[1] - 1 == point2[1]
    return true if point1[1] == point2[1] && point1[0] + 1 == point2[0]
    return true if point1[1] == point2[1] && point1[0] - 1 == point2[0] 
    false
  end
  
  #helpers
  def [](row, column)
    @maze[row][column]
  end
  
  def []=(row, column, mark)
    @maze[row][column] = mark
  end
  
end

if __FILE__ == $PROGRAM_NAME
  Solver.new.solve
end


