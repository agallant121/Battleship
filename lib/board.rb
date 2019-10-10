class Board
  attr_reader :cells

  def initialize(cells)
    @cells = cells
  end

  def valid_coordinate?(coordinate)
    # is coordinate contained within hash?
    @cells.include?(coordinate)
  end

  def same_letters?(coordinates)
   coordinates.map do |coordinate|
     coordinate[0]
     # require'pry'; binding.pry
   end.uniq.count == 1
  end

  def same_numbers?(coordinates)
    coordinates.map do |coordinate|
      coordinate[1]
    end.uniq.count == 1
  end

  def valid_placement?(ship, coordinates)
    ship.length == coordinates.length
  end
end
