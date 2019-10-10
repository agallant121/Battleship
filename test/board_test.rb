require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/board'
require_relative '../lib/cell'
require_relative '../lib/ship'

class BoardTest < Minitest::Test
  def setup
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    }
    @board = Board.new(@cells)
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_initialize
    assert_equal @cells, @board.cells
  end

  def test_coordinate_is_valid
    assert_equal true, @board.valid_coordinate?("A1")
    assert_equal true, @board.valid_coordinate?("D4")
    assert_equal false, @board.valid_coordinate?("A5")
    assert_equal false, @board.valid_coordinate?("E1")
    assert_equal false, @board.valid_coordinate?("A22")
  end

  def test_coordinates_must_be_length_of_ship
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2"])
    assert_equal false, @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
  end

  def test_all_letters_are_the_same
    assert_equal true, @board.same_letters?(["A1", "A2", "A4"])
    assert_equal false, @board.same_letters?(["B1", "A2", "C4"]) #sad path
  end

  def test_all_numbers_are_the_same
    assert_equal true, @board.same_numbers?(["A1", "B1", "C1"])
    assert_equal false, @board.same_numbers?(["A1", "A2", "A4"])
  end
end
