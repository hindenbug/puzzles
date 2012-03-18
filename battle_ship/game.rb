require_relative "battle_field"
require_relative "player"

class Game
  attr_accessor :rows, :cols, :player_one, :player_two

  def initialize(rows=10, cols=10)
    @rows = rows
    @cols = cols
  end

  def setup
    puts "Enter Your name:"
    player = setup_player
    puts "Your BattleField:"
    puts player.position_ships
    puts player.display_field
    player
  end

  def start
    @player_one = setup
    @player_two = setup
    puts "Ready to Rumble!!"

    while winner? do
      #puts @player_one.display_field
      #puts @player_two.display_field
      take_turn(@player_one, @player_two)
      take_turn(@player_two, @player_one)
    end
    puts result
    put "GAME OVER !!!"
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

  def take_turn(player, opponent)
    player.ships_left.times do
     puts "#{player.name} attack:"
     player.attack(opponent, *get_attack_coords)
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

  def result
    if @player_one.alive? && @player_two.dead?
      puts "#{@player_one.name} YOU WIN!!"
    elsif @player_one.dead? && @player_one.alive?
      puts "#{@player_two.name} YOU WIN!"
    end
  end

  def winner?
    @player_one.alive? && @player_two.dead? || @player_one.dead? && @player_two.alive?
  end

end
