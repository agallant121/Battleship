require_relative '../lib/board'
require_relative '../lib/cell'
require_relative '../lib/ship'
require_relative '../lib/computer'

class Game
  attr_reader :player_cells, :computer_cells

  def initialize

    @player_cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    }

    @computer_cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    }
    @player_cruiser = Ship.new("Cruiser", 3)
    @computer_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)
    @computer_submarine = Ship.new("Submarine", 2)
    @player_board = Board.new(@player_cells)
    @computer_board = Board.new(@computer_cells)
    @computer = Computer.new(@computer_board)
  end

  def start_game
    @computer.ship_gen(@computer_cruiser)
    @computer.ship_gen(@computer_submarine)

    puts @player_board.render(show = true)
    puts ""
    puts "Please choose coordinates using letters and"
    puts "numbers with spaces in between each coordinate. Once you"
    puts "have chosen 3 coordinates for the cruiser, (ex. A1 A2 A3),"
    puts "press enter and repeat these steps for placing the submarine.
    "

    puts "Please enter the 3 coordinates for cruiser:"
    coord_input = gets.chomp.upcase
    coord_input_cruiser = coord_input.split
    while @player_board.valid_placement?(@player_cruiser, coord_input_cruiser) == false
      puts "Please enter coordinates in a valid arrangement:"
      coord_input = gets.chomp.upcase
      coord_input_cruiser = coord_input.split
    end

    if @player_board.valid_placement?(@player_cruiser, coord_input_cruiser)
       @player_board.place(@player_cruiser, coord_input_cruiser)
       puts "Now, please enter the 2 coordinates for submarine:"
       coord_input = gets.chomp.upcase
       coord_input_sub = coord_input.split
       while @player_board.valid_placement?(@player_submarine, coord_input_sub) == false
         puts "Please enter coordinates in a valid arrangement:"
         coord_input = gets.chomp.upcase
         coord_input_sub = coord_input.split
       end
       if @player_board.valid_placement?(@player_submarine, coord_input_sub)
         @player_board.place(@player_submarine, coord_input_sub)
       end
    end

    puts "Nice placement; or was it?!"

    until @computer_cruiser.sunk? && @computer_submarine.sunk? || @player_cruiser.sunk? && @player_submarine.sunk?
      puts ""
      puts "======= Computer Board ========"
      puts ""
      puts @computer_board.render
      puts ""
      puts "======== Player Board ========="
      puts ""
      puts @player_board.render(show = true)
      puts ""
      puts "=============================="
      puts ""
      puts "Enter the coordinate for your shot:"
      loop do
        input = gets.chomp.upcase
        if @computer_board.valid_coordinate?(input)
          @computer_board.cells[input].fire_upon
          @computer.gen_shot(@player_board)
          break
        else
          puts "Invalid coordinate, please try again:"
        end
      end
    end
    if @computer_cruiser.sunk? && @computer_submarine.sunk?
      puts ""
      puts "You won!"
    else
      puts ""
      puts "I won!"
    end
  end
end
