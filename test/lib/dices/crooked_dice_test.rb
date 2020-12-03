require "test_helper"
require_relative "../../../lib/snake_ladders/dices/crooked_dice.rb"

class CrookedDiceTest < Minitest::Test
  def setup
    @dice = SnakeLadders::Dices::CrookedDice.new
  end

  def test_dice_roll
    assert_includes [2,4,6], @dice.roll
  end
end
