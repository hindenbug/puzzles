require_relative "battle_field"
require_relative "player"

class Game
  attr_accessor :rows, :cols, :player_one, :player_two

  def initialize(rows=10, cols=10)
    @rows = rows
    @cols = cols
  end

  def start
    [ :player_one, :player_two].each do |player|
      puts "Enter #{player}'s name:"
      player = setup_player
      puts "#{player.name}'s Board:"
      puts player.display_field
      puts
    end
  end

  private

  def setup_player
    name   = gets.strip
    field  = setup_field
    BattleShip::Player.new(name, field)
  end

  def setup_field
    BattleShip::BattleField.new(rows, cols)
  end

end

@game = Game.new
@game.start
puts @game.player_one
