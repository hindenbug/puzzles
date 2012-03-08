require_relative "battle_field"
require_relative "player"
require_relative 'battleship'

class Game
  include Battleship
  attr_accessor :rows, :cols, :player_one, :player_two

  def initialize(rows=10, cols=10)
    @rows = rows
    @cols = cols
  end

  def setup
    [ :player_one, :player_two].map! do |player|
      puts "Enter #{player}'s name:"
      player = setup_player
      puts "#{player.name}'s BattleField:"
      puts player.display_field
      puts player.position_ships
      puts player.display_field
    end
    puts "Ready to Rumble !!"
  end

  def start
    setup
    unless winner?
      take_turns
    end
  end

  private

  def setup_player
    name   = gets.strip
    field  = setup_field
    Player.new(name, field)
  end

  def setup_field
    BattleField.new(rows, cols)
  end

  def take_turns
    @player_one.field.ships.times do
      puts "#{@player_one} attack:"
      @player_one.attack(@player_two, get_attack_coords)
    end
    @player_two.field.ships.times do
      puts "#{@player_two} attack:"
      @player_two.attack(@player_one, get_attack_coords)
    end
  end

  def get_attack_coords
    ### TODO ENFORCE TYPE CHECK ####
    puts "Enter X co-ordinate to attack :"
    x = gets.chomp.to_i
    puts "Enter Y co-ordinate to attack :"
    y = gets.chomp.to_i
    [x, y]
  end

  def winner?
    if @player_one.alive? && @player_two.dead?
      puts "#{@player_one.name} YOU WIN!!"
    elsif @player_one.dead? && @player_one.alive?
      puts "#{@player_two.name} YOU WIN!"
    else
      return false
    end
  end

end
