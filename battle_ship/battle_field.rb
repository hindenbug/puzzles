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
        ###### need to check ship collision/overlapping
      else
        raise "Given co-ordinates are out of bound"
      end
    rescue Exception => e
      puts e.message
    end
  end

  def ship_count
    @ships.map {|ship| !ship.sunk?}
  end
end
