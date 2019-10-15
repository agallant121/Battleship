require_relative '../lib/board'
require_relative '../lib/cell'
require_relative '../lib/ship'

class Game
  attr_reader :player_cells, :computer_cells

  def initialize(player, computer)

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
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @player_board = Board.new(@player_cells)
    @computer_board = Board.new(@computer_cells)
  end

  def main_menu
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    loop do
      input = gets.chomp
      if input == "p"
        start_game
      elsif
        input == "q"
        puts "You are the weakest link, goodbye."
        break
      else
        puts "Invalid entry. Please choose p or q."
      end
    end
  end

  def start_game
    # x = @computer_board.cells.keys.sample(3)
    #
    #   x.map do |coord|
    #     coord
    #     if @computer_board.valid_placement?(@cruiser, x)
    #       @computer_board.place(@cruiser, x)
    #     end
    # end


    y = @computer_board.cells.keys.sample(2)

    loop do
      y until @computer_board.valid_placement?(@submarine, y)
      # require "pry"; binding.pry
      break
    end

    @computer_board.place(@submarine, y)


    puts @player_board.render(show = true)
    puts ""
    puts "Please choose coordinates using letters and"
    puts "numbers with spaces in between each coordinate. Once you"
    puts "have chosen 3 coordinates for the cruiser, (ex. A1 A2 A3),"
    puts "press enter and repeat these steps for placing the submarine.
    "

    puts "Please enter the 3 coordinates for cruiser:"
          coord_input = gets.chomp.upcase
          coord_input = coord_input.split
        if @player_board.valid_placement?(@cruiser, coord_input)
           @player_board.place(@cruiser, coord_input)
            puts "Now, please enter the 2 coordinates for submarine:"
              coord_input = gets.chomp.upcase
              coord_input = coord_input.split

            if @player_board.valid_placement?(@submarine, coord_input)
               @player_board.place(@submarine, coord_input)

               puts "Nice placement; or was it?!"
               puts ""
               puts "======= Computer Board ========"
               puts ""
               puts @computer_board.render(show = false)#true to show ships
               puts ""
               puts "======== Player Board ========="
               puts ""
               puts @player_board.render(show = true)
               puts ""
               puts "=============================="
            end
        end
      end
end


# loop do
  @game = Game.new(@player_board, @computer_board)
  @game.main_menu
