require "rspec"
require_relative "../battle_field"
require_relative "../player"
#require_relative "../game"

describe Player do

  let(:field)    { BattleField.new(10, 10) }
  let(:player)  { Player.new("Manoj", field ) }

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
      expected = (("- " * 10).strip + "\n") * 10
      result.should === expected
    end
  end

  describe "#position_ships" do
    it "should position ships for a player" do
      #ships = [:submarine, :destroyer]
      player.position_ships
      player.battle_field.ships.should eql field.ships
    end
  end

  describe "#attack" do
    before :each do
      @player2 = Player.new("MK", BattleField.new(10, 10))
      @player2.battle_field.deploy_ship(:cruiser, 4, 4)
    end

    context "when ship is present on the given co-ordinates" do
      it "the attack should be a HIT!!" do
        @player2.battle_field.warzone[4][5].should == "C"
        player.attack(@player2, 4, 5)
        @player2.battle_field.warzone[4][5].should == "*"
      end
    end

    context "when ship is not present on the given co-ordinates" do
      it "the attack should be a MISS" do
        @player2.battle_field.warzone[4][5].should == "C"
        player.attack(@player2, 4, 8)
        @player2.battle_field.warzone[4][5].should == "C"
      end
    end
  end

end
