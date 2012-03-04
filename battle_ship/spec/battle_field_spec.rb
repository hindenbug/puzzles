require "rspec"
require_relative "../battle_field"
require_relative "../battle_ship"

describe BattleField do

  let(:field) { BattleField.new }

  it "should create battle field of 10x10" do
    field.warzone.should be_a_kind_of Array
    field.rows.should eql 10
    field.cols.should eql 10
  end

  it "should deploy ship" do
    ship = field.deploy_ship("carrier", 1, 1 )
    ship.should be_an_instance_of BattleShip
    ship.warzone.should =~ field.warzone
  end

end
