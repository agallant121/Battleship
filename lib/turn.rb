class Turn
  attr_reader :shot

  def initialize(shot)
    #adding board in initialize might create new board each turn
    @shot = shot
  end


end
