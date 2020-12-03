require_relative "./player.rb"
require_relative "./dices/dice.rb"
require_relative "./dices/crooked_dice.rb"
require_relative "./board.rb"
require_relative "./session.rb"

module SnakeLadders
  class Game

    attr_accessor :board, :dice, :players, :session, :current_player, :complete

    def play(command)
      set_current_player
      play_turn
    end

    private
      def initialize
        self.players = []
        self.dice = Dices::Dice.new
        self.board = Board.new()
        self.players << Player.new()
        self.session = Session.new(players)
        self.complete = false
      end

      def play_turn
        dice_output = dice.roll
        update_player_state(dice_output)
        mark_complete if board_exausted?
      end

      def update_player_state(dice_output)
        location = session.get(current_player)
        new_location = board.get_new_location(location, dice_output)
        session.set(current_player, new_location) if new_location != location
      end

      def current_player
        @current_player ||= players.first
      end

      def set_current_player
        (self.current_player = players.first && return) if !current_player
        self.current_player = players[players.index(current_player) + 1]
      end

      def mark_complete
        self.complete = true
        after_complete
      end

      def after_complete
        display_state
        p "Game is complete #{current_player.name} is the winner"
        exit
      end

      def board_exausted?
        location = session.get(current_player)
        board.exausted_by?(location)
      end
  end
end