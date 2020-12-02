module SnakeLadders
  class Session
    attr_accessor :players_info

    def get(player)
      players_info[player]
    end

    def set(player, location)
      players_info[player] = location
    end


    private
    def initialize players
      self.players_info = {}
      players.each { |player| puts player && self.players_info[player] = nil }
    end
  end
end