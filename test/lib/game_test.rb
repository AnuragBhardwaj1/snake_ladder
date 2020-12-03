require "test_helper"
require_relative "../../lib/snake_ladders/game.rb"

class GameTest < Minitest::Test
  def setup
    @game = SnakeLadders::Game.new
  end

  def test_new_game_is_not_complete
    refute @game.complete
  end

  def test_new_game_has_dice
    assert_instance_of SnakeLadders::Dices::Dice, @game.dice
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

    assert_equal 6, @game.session.players_info[player]
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
    @game.send :mark_complete
    assert @game.complete
  end

  def test_play_turn
    mocked_dice = Minitest::Mock.new
    @game.dice = mocked_dice

    mocked_dice.expect :roll, 6
    @game.send :play_turn
    mocked_dice.verify
  end

  def test_play_turn_methods_called
    mocked_dice = Minitest::Mock.new
    @game.dice = mocked_dice
    dice_output= 6
    game_spy = ::Spy.on(@game, :update_player_state)

    mocked_dice.expect :roll, dice_output
    @game.send :play_turn

    assert game_spy.has_been_called_with?(dice_output)
  end

  def test_play_turn_calls_update_player_state
    mocked_dice = Minitest::Mock.new
    @game.dice = mocked_dice
    dice_output= 6
    update_player_state_spy = ::Spy.on(@game, :update_player_state)

    mocked_dice.expect :roll, dice_output
    @game.send :play_turn

    assert update_player_state_spy.has_been_called_with?(dice_output)
  end

  def test_play_turn_calls_board_exausted?
    board_exausted_spy = ::Spy.on(@game, :board_exausted?)

    @game.send :play_turn

    assert board_exausted_spy.has_been_called?
  end

  def test_play_turn_does_not_calls_mark_complete
    mark_complete_spy = ::Spy.on(@game, :mark_complete)

    @game.send :play_turn

    refute mark_complete_spy.has_been_called?
  end

  def test_play_turn_calls_mark_complete
    @game.complete = true
    @game.stub :board_exausted? ,true do
      game_spy = ::Spy.on(@game, :mark_complete)
      @game.send :play_turn

      assert game_spy.has_been_called?
    end
  end

end
