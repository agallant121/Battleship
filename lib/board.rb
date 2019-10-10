class Board
  attr_reader :cells

  def initialize(cells)
    @cells = cells
  end

  def valid_coordinate?(coordinate)
    # is coordinate contained within hash?
    @cells.include?(coordinate)
  end

  def valid_placement?(ship, coordinate_array)
    # is the ship's length equal to the number of coordinates in array
    ship.length == coordinate_array.length
  end
end
