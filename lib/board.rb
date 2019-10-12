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

  #new code by you dont commit shit
  def consecutive_numbers_forward?(coordinates)
    # if same_letters?(coordinates) && !same_numbers?(coordinates)
      numbers = coordinates.map do |coordinate|
        coordinate[1].to_i
      end

      numbers.each_cons(3).all? do |num1, num2|
        num2 == num1 + 1
      end
  end

  def consecutive_letters_forward?(coordinates)
    # if same_letters?(coordinates) && !same_numbers?(coordinates)
      letters = coordinates.map do |coordinate|
        # require 'pry'; binding.pry
        coordinate[0].ord
      end

      letters.each_cons(3).all? do |lett1, lett2|
        lett2 == lett1 + 1
      end
  end

end
