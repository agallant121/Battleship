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


  def render
    if !shot_at? #&& empty? #still want dot when we start before showing ship
      "."
    elsif shot_at? && empty?
      "M"
    end
  end
end
