require_relative "ship"

class BattleField
  attr_accessor :rows, :cols, :warzone, :ships

  def initialize(rows, cols)
    @rows = rows
    @cols = cols
    @warzone =  prepare_field
    @ships = []
  end

  def prepare_field
    Array.new(@rows) { Array.new(@cols) { "-" } }
  end

  def deploy_ship(ship, x, y, direction = :h)
    begin
      if (x>=0 && x < rows - 1) && (y >= 0 && y < cols-1)
        @ships << Ship.new(self, ship, x, y, direction)
      else
        raise "Given co-ordinates are out of bound"
      end
    rescue Exception => e
      puts e.message
    end
  end
end


#@game = BattleShip::BattleField.new
#@game.deploy_ship("aircraft_carrier", 3, 3)
#@game.deploy_ship("battleship", 4, 0)
#puts @game.display_field
