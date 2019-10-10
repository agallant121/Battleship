class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate, ship = nil)
    @coordinate = coordinate
    @ship = ship
    @fired_upon = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def shot_at?
    @fired_upon
  end

  def fire_upon
    # return if @fired_upon #checking if it has been fired upon
    @fired_upon = true
    if !empty?
      @ship.hit
    end
  end

  def render(show = false) # default gets rid of errors above in test
    if  shot_at? && !@ship
      "M"
    elsif shot_at? && @ship.sunk?
      "X"
    elsif shot_at? && @ship
      "H"
    elsif @ship && show == true
      "S"
    else
      "."
    end
  end
end
