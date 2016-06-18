class PieceSet
  attr_accessor :ships
    
    def initialize
        @ships = {
            "Aircraft Carrier" => Array.new(5),
            "Battleship" => Array.new(4),
            "Submarine" => Array.new(3),
            "Destroyer" => Array.new(3),
            "Patrol Boat" => Array.new(2) 
        }
        @sunk = []
    end
    
    def change_state(pos)
      @ships.each do |name, ship|
        ship.map!{|x| x == pos ? x = :x : x = x}
        if sunk?(ship) 
          puts "The #{name} is sunk!" if sunk?(ship) && 
                                         !(@sunk.include?(name))
          @sunk << name
        end
      end
    end
    
    def sunk?(ship)
      ship.count(:x) == ship.length
    end
    
  def display_status
    @ships.each do |name, ship|
      puts "#{name}: #{ship}"
    end
  end
end
