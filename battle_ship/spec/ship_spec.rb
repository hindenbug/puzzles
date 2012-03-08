require "rspec"
require_relative "../battle_field"
require_relative "../ship"

describe Ship do

  let(:field) { BattleField.new(10, 10) }
  let(:ship)  { Ship.new(field, :aircraft_carrier, 1, 1, :h) }

  it "should deploy a new ship of the given type" do
    ship.ship_type.should eql :aircraft_carrier
    ship.direction.should eql :h
    field = ship.warzone
    field[1][1..5].each do |cell|
      cell.should eql "A"
    end
  end


  describe "#hit?" do
    before :each do
      ship.warzone[2][2] = "C"
      ship.warzone[2][3] = "-"
    end

    it "should check if the ship was hit or not" do
      ship.hit?(2,2).should be_true
      ship.hit?(2,3).should_not be_true
    end
  end

  describe "#hit!" do
    context "when the ship is hit? " do
      before do
        ship.warzone[2][2] = "C"
        ship.hits.should eql 0
        ship.hit?(2,2).should be_true
      end

      it "should mark the ship as hit" do
        expect { ship.hit!(2,2) }.to change{ship.hits}.by(1)
        ship.warzone[2][2].should eql "*"
      end
    end
  end

  describe "#sunk?" do
    context "when hits equal the ship size" do
      before { ship.hits = 5 }

      it "ship has sunk?" do
        ship.should be_sunk
      end
    end

    context "when hits not equal to size of ship" do
      before { ship.hits = 3}

      it "ship should sink" do
        ship.should_not be_sunk
      end
    end
  end


end

