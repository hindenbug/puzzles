module BattleShip
  class Player

    attr_accessor :name, :warzone

    def initialize(name, field)
      @name = name
      @warzone = field.warzone
    end

    def display_field
      warzone.map {|row| row.join(" ")}.join("\n")
    end
  end
end
