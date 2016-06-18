class HumanPlayer
  attr_accessor :board
  
  def initialize
    @board = Board.new
  end
  
  def get_play(opponent)
    move = ""
    loop do 
      puts "Where would you like to attack? y, x"
      move = gets.chomp
      move = move.split(',').map!{|x|x.to_i}
      break if @board.avalibe_spaces.include?(move) || 
               @board.hidden_ships.include?(move)
      puts "Not a valid move"
    end
    move
  end
  
  def place_ships
    start = ""
    location = ""
    @board.pieceset.ships.each do |name, ship|
      loop do 
        puts "Where would you like to place the nose of the ship?"
        start = gets.chomp
        start = start.split(",").map{|x|x.to_i}
        puts "Which direction to run the ship? (up,down,left,right)"
        direction = gets.chomp
        location = @board.get_location(direction, start, ship.length)
        break if @board.move_is_valid?(location)
        puts "Not a valid location"
      end
    end
    @board.place_ship_at(location)
  end
  
  
end
