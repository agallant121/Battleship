class Computer
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def ship_gen(ship)
    coords = @board.cells.keys.sample(ship.length)

    until @board.valid_placement?(ship, coords)
      coords = @board.cells.keys.sample(ship.length)
    end
    @board.place(ship, coords)
  end

  def gen_shot(board)
    loop do
      shot = board.cells.keys.sample

      if !board.cells[shot].shot_at?
        board.cells[shot].fire_upon
        break
      end
    end
  end
end
