require "rspec"
require_relative "../battle_field"
require_relative "../player"

describe BattleShip::Player do

  let(:field)    { BattleShip::BattleField.new(3, 3) }
  let(:player)   { BattleShip::Player.new("Manoj", field ) }

  describe "#new" do
    it "should create a new player" do
      player.should be_an_instance_of BattleShip::Player
      player.should respond_to(:name)
      player.should respond_to(:warzone)
    end

    it "should have name" do
      player.name.should eql "Manoj"
    end

    it "should have a battlezone" do
      player.warzone.should eql field.warzone
    end
  end

  describe "#display_field" do
    it "should display the player board" do
      result = player.display_field
      expected = "x x x\nx x x\nx x x"
      result.should === expected
    end
  end

end
