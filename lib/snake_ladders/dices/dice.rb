require_relative "../dice.rb"

module SnakeLadders
  module Dices
    class Dice < SnakeLadders::Dice
      def roll
        [2,4,6].sample
      end
    end
  end
end
