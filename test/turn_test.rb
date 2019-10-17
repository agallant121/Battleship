require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/board'
require_relative '../lib/cell'
require_relative '../lib/ship'
require_relative '../lib/turn'
# require_relative '../lib/game'

class TurnTest < Minitest::Test

  def setup
    @player_turn_1 = Turn.new("A1")
    @computer_turn_1 = Turn.new("A1")
    @player_board = Board.new(@player_cells)
    @computer_board = Board.new(@computer_cells)
  end

  def test_it_exists
    assert_instance_of Turn, @player_turn_1
  end

  def test_initialize
    assert_equal "A1", @player_turn_1.shot
    assert_equal "A1", @computer_turn_1.shot
  end

end
