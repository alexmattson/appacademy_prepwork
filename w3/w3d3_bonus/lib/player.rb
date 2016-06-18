class HumanPlayer
  attr_accessor :board
  
  def initialize
    @board = Board.new
  end
  
  def get_play(opponent)
    move = ""
    valid = false
    until valid 
      puts "Where would you like to attack? y, x"
      move = gets.chomp
      move = move.split(',').map!{|x|x.to_i}
      opponent.board.pieceset.ships.each do |name, ship|
        valid = true if opponent.board.avalibe_spaces.include?(move) || 
                        ship.include?(move)
      end
      puts "Not a valid move" if !valid
    end
    move
  end
  
  def place_ships
    start = ""
    location = ""
    @board.pieceset.ships.each do |name, ship|
      @board.display(true)
      start = get_start(name, ship)
      location = get_direction(start, ship)
      @board.place_ship_at(location)
      @board.pieceset.ships[name] = location
      @board.find_hidden_ships
    end
  end
  
  def get_start(name, ship)
    start = ""
    loop do 
      puts "Where would you like to place the nose of the #{name}?"
      puts "As a reminder, it's #{ship.length} spaces long."
      start = gets.chomp
      start = start.split(",").map{|x|x.to_i}
      break if @board.avalibe_spaces.include?(start) 
      puts "Not a valid location"
    end
    start
  end
  
  def get_direction(start, ship)
    directions = ["up", "down", "left", "right"]
    location = ""
    loop do
      puts "Which direction would you like to run the ship? (up,down,left,right)"
      direction = gets.chomp.strip
      location = @board.get_location(direction, start, ship.length)
      break if @board.move_is_valid?(location) && 
               directions.include?(direction.downcase)
      puts "Not a valid direction"
    end
    location
  end
  
  def see_status
    puts "_____________________________"
    puts "      Your Fleet Status      "
    puts "     will show :x if hit     "
    @board.pieceset.display_status
    puts "_____________________________"
  end
  
end
