require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/ship'
require_relative '../lib/cell'

class CellTest < Minitest::Test
  def setup
    @cell_1 = Cell.new("B4")
    @cell_2 = Cell.new("C3")
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists
    assert_instance_of Cell, @cell_1
  end

  def test_initialize
    assert_equal "B4", @cell_1.coordinate
  end

  def test_it_starts_with_no_ship
    assert_nil @cell_1.ship
  end

  def test_it_is_empty
    assert_equal true, @cell_1.empty?
  end

  def test_it_can_be_placed

    @cell_1.place_ship(@cruiser)
    assert_equal @cruiser, @cell_1.ship
    assert_equal false, @cell_1.empty?
  end

  def test_it_can_be_fired_upon
    @cell_1.place_ship(@cruiser)
    assert_equal false, @cell_1.shot_at?
    @cell_1.fire_upon
    assert_equal 2, @cell_1.ship.health
    assert_equal true, @cell_1.shot_at? #not done
  end

  def test_it_can_render_not_fired_upon
    assert_equal ".", @cell_1.render
  end

  def test_it_can_render_a_miss
    @cell_1.fire_upon
    assert_equal "M", @cell_1.render
  end

  def test_it_renders_dot_before_ship_shown
    @cell_2.place_ship(@cruiser)
    assert_equal ".", @cell_2.render
  end

  # def test_it_shows_a_ship
  #
  # end



end
