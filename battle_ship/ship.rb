module BattleShip
    class Ship
    attr_accessor :ship_type, :x, :y, :warzone, :direction, :state

    def initialize(field, ship, x, y, direction)
      @ship_type = ship
      @x = x
      @y = y
      @warzone = field.warzone
      @direction = direction
      place_ships
    end

    private

    def place_ships
      case ship_type.downcase
      when "aircraft_carrier"
        deploy(5, "A")
      when "battleship"
        deploy(4, "W")
      when "cruiser"
        deploy(3, "S")
      when "submarine"
        deploy(3, "C")
      when "destroyer"
        deploy(2, "D")
      end
    end

    def deploy(length, ship_name)
      if direction == "vertical"
        end_point = x + (length - 1)
        x.upto(end_point) do |i|
          if warzone[i][y].empty?
            warzone[i][y] = ship_name
          else
            raise "ERROR"
            false
          end
        end
      elsif direction == "horizontal"
        end_point = y + (length - 1)
        y.upto(end_point) do |i|
          if warzone[x][i].empty?
            warzone[x][i] = ship_name
          else
            raise "ERROR"
            false
          end
        end
      end
      warzone
    end
  end
end
