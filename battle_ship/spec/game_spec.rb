require "rspec"
require_relative "../game"

describe Game do

  let(:game) { Game.new(3, 3) }

  it "should take in rows and cols as parameters and return a game object" do
    game.should be_an_instance_of Game
    game.rows.should eql 3
    game.cols.should eql 3
    game.should respond_to(:player_one)
    game.should respond_to(:player_two)
  end

  describe "#setup" do
    #before(:each)  { game.setup }

    #it "should setup players and boards" do
    #  game
    #end
  end

  describe "#start" do


  end
end
