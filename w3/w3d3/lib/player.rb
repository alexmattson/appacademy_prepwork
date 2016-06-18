class HumanPlayer
  
  def get_play(board)
    move = ""
    loop do 
      puts "Where would you like to attack? y, x"
      move = gets.chomp
      move = move.split(',').map!{|x|x.to_i}
      break if board.avalibe_spaces.include?(move) || 
               board.hidden_ships.include?(move)
      puts "Not a valid move"
    end
    move
  end
  
  
end
