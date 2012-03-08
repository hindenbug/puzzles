require "rspec"
require_relative "../battle_field"
require_relative "../player"
#require_relative "../game"

describe Player do

  let(:field)    { BattleField.new(3, 3) }
  let(:player1)  { Player.new("Manoj", field ) }

  describe "#new" do
    it "should create a new player" do
      player.should be_an_instance_of Player
      player.should respond_to(:name)
      player.should respond_to(:battle_field)
    end

    it "should have name" do
      player.name.should eql "Manoj"
    end

    it "should have a battlefield" do
      player.battle_field.should eql field
      player.battle_field.ships.size.should == 0
    end
  end

  describe "#display_field" do
    it "should display the player board" do
      result = player.display_field
      expected = "- - -\n- - -\n- - -"
      result.should === expected
    end
  end

  describe "#position_ships" do
    it "should position ships for a player" do
      #ships = [:aircraft_carrier, :battleship, :cruiser, :submarine, :destroyer]
      player.position_ships
      player.battle_field.ships.should eql field.ships
    end
  end

  describe "#attack" do

  end

end
