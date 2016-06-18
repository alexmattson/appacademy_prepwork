class PieceSet
  attr_accessor :ships
    
    def initialize
        @ships = {
            "Aircraft Carrier" => Array.new(5),
            # "Battleship" => Array.new(4),
            # "Submarine" => Array.new(3),
            # "Destroyer" => Array.new(3),
            # "Patrol Boat" => Array.new(2) 
        }
    end
    
    def sunk?(ship)
      ship.count("x") == ship.length
    end
end
