require "test_helper"
require_relative "../../lib/snake_ladders/game.rb"
require_relative "../../lib/snake_ladders/player.rb"

class GameTest < Minitest::Test
  def setup
    @game = SnakeLadders::Game.new
  end

  def test_new_game_is_not_complete
    refute @game.complete
  end

  def test_new_game_has_dice
    assert_instance_of SnakeLadders::Dice, @game.dice
  end

  def test_new_game_has_board
    assert_instance_of SnakeLadders::Board, @game.board
  end

  def test_new_game_has_player
    assert_instance_of SnakeLadders::Player, @game.players.first
  end

  def test_new_game_has_session
    assert_instance_of SnakeLadders::Session, @game.session
  end

  def test_update_player_state_when_position_can_be_changed
    player = @game.players.first
    @game.send :update_player_state, 6

    assert_equal 5, @game.session.players_info[player]
  end

  def test_update_player_state_when_can_not_be_changed
    player = @game.players.first
    @game.session.players_info[player] = 98
    @game.send :update_player_state, 4

    assert_equal 98, @game.session.players_info[player]
  end

  def test_set_current_player
    new_player = SnakeLadders::Player.new
    @game.players << new_player
    @game.send :set_current_player
    assert_equal new_player, @game.send(:current_player)
  end

  def test_mark_complete
    @game.stub :after_complete, true do
      @game.send :mark_complete
      assert @game.complete
    end
  end

  def test_play_turn
    mocked_dice = Minitest::Mock.new
    @game.dice = mocked_dice

    mocked_dice.expect :roll, 6
    @game.send :play_turn
    mocked_dice.verify
  end
end
