require "test_helper"
require_relative "../../../lib/snake_ladders/dices/dice.rb"

class DiceTest < Minitest::Test
  def setup
    @dice = SnakeLadders::Dices::Dice.new
  end

  def test_dice_roll
    assert_includes (0..6), @dice.roll
  end
end
