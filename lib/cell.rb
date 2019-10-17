class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship)
    return false if !empty?
    @ship = ship
  end

  def shot_at?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    if !empty?
      @ship.hit
    end
  end

  def render(show = false)
    if shot_at? && !@ship
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
