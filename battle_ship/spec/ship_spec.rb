require "rspec"
require_relative "../battle_field"
require_relative "../battle_ship"

describe BattleShip do

  let(:field) { BattleField.new }
  let(:ship)  { BattleShip.new(field, "aircraft_carrier", 1, 1, "horizontal") }

  it "should deploy a new ship of the given type" do
    ship.ship_type.should eql "aircraft_carrier"
    ship.direction.should eql "horizontal"
    field = ship.warzone
    field[1][1..5].each do |cell|
      cell.should eql "C"
    end
  end


end

