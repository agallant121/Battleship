require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/ship'
require_relative '../lib/cell'

class CellTest < Minitest::Test
  def setup
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists
    assert_instance_of Cell, @cell
  end

  def test_initialize
    assert_equal "B4", @cell.coordinate
  end

  def test_it_starts_with_no_ship
    assert_nil @cell.ship
  end

  def test_it_is_empty
    assert_equal true, @cell.empty?
  end

  def test_it_can_be_placed

    @cell.place_ship(@cruiser)
    assert_equal @cruiser, @cell.ship
    assert_equal false, @cell.empty?
  end
end
