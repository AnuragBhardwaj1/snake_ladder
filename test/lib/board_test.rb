require "test_helper"
require_relative "../../lib/snake_ladders/board.rb"

class TestBoard < Minitest::Test
  def setup
    @board = SnakeLadders::Board.new
  end

  def test_it_is_expected_to_initialize_with_cells
    assert_equal 100, @board.cells.length
  end

  # def test_get_new_location_when_not_started
  #   assert_equal (-1), @board.get_new_location(nil)
  # end

  def test_get_new_location_when_vaild_dice_roll
    assert_equal 16, @board.get_new_location(10, 6)
  end

  def test_get_new_location_when_non_accomodative_dice_roll
    assert_equal 97, @board.get_new_location(97, 5)
  end

  def test_exausted_by_when_exhausted
    assert_equal true, @board.exausted_by?(99)
  end

  def test_exausted_by_when_not_exhausted
    assert_equal false, @board.exausted_by?(50)
  end
end
