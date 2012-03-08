 class Ship
  attr_accessor :ship_type, :x, :y, :warzone, :direction, :hits
  SHIP_SIZE = {:aircraft_carrier => 5, :battleship => 4, :cruiser => 3, :submarine => 3, :destroyer => 2}

  def initialize(field, ship, x, y, direction)
    @ship_type = ship
    @x = x
    @y = y
    @warzone = field.warzone
    @direction = direction
    @hits = 0
    place_ships
  end

  def hit?(x, y)
    warzone[x][y] != "-"
  end

  def hit!(x, y)
    warzone[x][y] = "*"
    @hits += 1
  end

  def sunk?
    hits == SHIP_SIZE[ship_type]
  end

  private

  def place_ships
    case ship_type
    when :aircraft_carrier
      deploy(5, "A")
    when :battleship
      deploy(4, "W")
    when :cruiser
      deploy(3, "S")
    when :submarine
      deploy(3, "C")
    when :destroyer
      deploy(2, "D")
    else
      puts "Invalid Ship Type"
    end
  end

  def deploy(length, ship_name)
    ### TODO refactor looks ugly ####
    if direction == :v
      end_point = x + (length - 1)
      x.upto(end_point) do |i|
        if warzone[i][y] == "-"
          warzone[i][y] = ship_name
        else
          raise "ERROR"
          false
        end
      end
    elsif direction == :h
      end_point = y + (length - 1)
      y.upto(end_point) do |i|
        if warzone[x][i] == '-'
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
