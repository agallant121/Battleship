require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/board'
require_relative '../lib/cell'
require_relative '../lib/ship'
require_relative '../lib/computer'

class ComputerTest < Minitest::Test
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

    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @computer_board = Board.new(@cells)
    @computer = Computer.new(@computer_board)
  end

  def test_it_exists
    assert_instance_of Computer, @computer
  end

  def test_initialize
    assert_equal @computer_board, @computer.board
  end

  def test_it_can_generate_random_placements
    @computer.ship_gen(@cruiser)

    actual = @computer.board.cells.values.all? do |cell_obj|
      cell_obj.empty?
    end
    expected = false

    assert_equal expected, actual
  end
end
