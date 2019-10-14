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
   end.uniq.count == 1
  end

  def same_numbers?(coordinates)
    coordinates.map do |coordinate|
      coordinate[1]
    end.uniq.count == 1
  end

  def consecutive_numbers_forward?(coordinates)
      numbers = coordinates.map do |coordinate|
        coordinate[1].to_i
      end

      numbers.each_cons(2).all? do |num1, num2|
        num2 == num1 + 1
      end
  end

  def consecutive_letters_forward?(coordinates)
      letters = coordinates.map do |coordinate|
        coordinate[0].ord
      end
      letters.each_cons(2).all? do |lett1, lett2|
        lett2 == lett1 + 1
      end
  end

  def valid_columns?(coordinates)
     same_numbers?(coordinates) && consecutive_letters_forward?(coordinates)
  end

  def valid_rows?(coordinates)
    same_letters?(coordinates) && consecutive_numbers_forward?(coordinates)
  end

  def valid_placement?(ship, coordinates)
    valid = coordinates.all? do |coordinate|
      return false if @cells[coordinate].ship != nil
      valid_coordinate?(coordinate)
    end

    valid && ship.length == coordinates.length
  end

  def place(ship, coordinates)
    if valid_placement?(ship, coordinates)
      coordinates.map do |coordinate|
        @cells[coordinate].place_ship(ship)
      end
    else
      "Sorry Invalid Placement"
    end
  end

  def render(show = false)
    "  1 2 3 4 \n\
A #{@cells['A1'].render(show)} #{@cells['A2'].render(show)} #{@cells['A3'].render(show)} #{@cells['A4'].render(show)} \n\
B #{@cells['B1'].render(show)} #{@cells['B2'].render(show)} #{@cells['B3'].render(show)} #{@cells['B4'].render(show)} \n\
C #{@cells['C1'].render(show)} #{@cells['C2'].render(show)} #{@cells['C3'].render(show)} #{@cells['C4'].render(show)} \n\
D #{@cells['D1'].render(show)} #{@cells['D2'].render(show)} #{@cells['D3'].render(show)} #{@cells['D4'].render(show)} \n"


  end

end
