require_relative "ship"

module BattleShip
  class BattleField
    attr_accessor :rows, :cols, :warzone

    def initialize(rows, cols)
      @rows = rows
      @cols = cols
      @warzone =  prepare_field
    end

    def prepare_field
      Array.new(@rows) { Array.new(@cols) { "x" } }
    end

    def deploy_ship(ship, x, y, direction = "horizontal")
      if (x>=0 && x < rows - 1) && (y >= 0 && y < cols-1)
        Ship.new(self, ship, x, y, direction)
      end
    end

    private
  end
end


#@game = BattleShip::BattleField.new
#@game.deploy_ship("aircraft_carrier", 3, 3)
#@game.deploy_ship("battleship", 4, 0)
#puts @game.display_field
