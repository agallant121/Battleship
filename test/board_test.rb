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
    @player_board = Board.new(@cells)
    @computer_board = Board.new(@cells)
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
    assert_equal true, @board.valid_placement?(@submarine, ["A1", "A2"])
    assert_equal true, @board.valid_placement?(@cruiser, ["B1", "C1", "D1"])
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

  def test_numbers_are_consecutive
    assert_equal true, @board.consecutive_numbers_forward?(["A1", "A2", "A3"])
    assert_equal false, @board.consecutive_numbers_forward?(["A1", "A5", "A3"])
  end

  def test_letters_are_consecutive
    assert_equal true, @board.consecutive_letters_forward?(["A1", "B2", "C4"])
    assert_equal false, @board.consecutive_letters_forward?(["A1", "C2", "D4"])
  end

  def test_it_has_valid_columns
    assert_equal true, @board.valid_columns?(["A1", "B1", "C1"])
    assert_equal false, @board.valid_columns?(["A2", "B1", "C1"])
  end

  def test_it_has_valid_rows
    assert_equal true, @board.valid_rows?(["A1", "A2", "A3"])
    assert_equal false, @board.valid_rows?(["A1", "B2", "A3"])
  end

  def test_coordinates_cannot_be_diagonal
    assert_equal false, @board.valid_rows?(["A1", "B2", "C3"])
    assert_equal true, @board.valid_rows?(["A1", "A2", "A3"])
    assert_equal true, @board.valid_columns?(["A1", "B1", "C1"])
    assert_equal false, @board.valid_columns?(["C2", "D3"])
  end

  def test_it_can_place_ships
    @board.place(@cruiser, ["A1", "A2", "A3"])
    cell_1 = @board.cells["A1"]
    cell_2 = @board.cells["A2"]
    cell_3 = @board.cells["A3"]

    assert_equal cell_1, @board.cells["A1"]
    assert_equal cell_2, @board.cells["A2"]
    assert_equal cell_3, @board.cells["A3"]
    assert_equal @cruiser, cell_1.ship
    assert_equal @cruiser, cell_2.ship
    assert_equal @cruiser, cell_3.ship
    assert_equal true, cell_3.ship == cell_2.ship
  end

  def test_ships_cannot_overlap
    @board.place(@cruiser, ["A1", "A2", "A3"])

    assert_equal false, @board.valid_placement?(@submarine, ["A1", "B1"])
  end

  def test_it_can_render_dots
    @board.place(@cruiser, ["A1", "A2", "A3"])
    expected = "1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"

    assert_equal expected, @board.render
  end

  def test_it_can_render_ships
    @board.place(@cruiser, ["A1", "A2", "A3"])
    expected = "1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n"

    assert_equal expected, @board.render(true)
  end

end
