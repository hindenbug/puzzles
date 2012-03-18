require "rspec"
require_relative "../battle_field"
require_relative "../ship"

describe BattleField do

  let(:field) { BattleField.new(10, 10) }

  it "should create battle field of 10x10" do
    field.warzone.should be_a_kind_of Array
    field.rows.should eql 10
    field.cols.should eql 10
  end

  it "should deploy ship" do
    field.deploy_ship("aircraft_carrier".to_sym, 1, 1 )
    field.ships.each do |ship|
      ship.should be_an_instance_of Ship
      ship.warzone.should =~ field.warzone
    end
  end

end
