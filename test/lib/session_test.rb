require "test_helper"
require_relative "../../lib/snake_ladders/session.rb"
require_relative "../../lib/snake_ladders/player.rb"

class SessionTest < Minitest::Test
  def setup
    @player = SnakeLadders::Player.new
    @session = SnakeLadders::Session.new([@player])
  end

  def test_get_when_not_present
    assert_nil @session.get(@player)
  end

  def test_get_when_present
    @session.players_info[@player] = 5
    assert 5, @session.get(@player)
  end

  def test_set_when_present
    @session.set(@player, 5)
    assert 5, @session.players_info[@player]
  end
end
