require_relative '../lib/board'
require_relative '../lib/cell'
require_relative '../lib/ship'

class Game
  def initialize(player, computer)
    @cells = {
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
    @player_board = Board.new(@cells)
    @computer_board = Board.new(@cells)
  end

  def main_menu
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    loop do
      input = gets.chomp
      if input == "p"
        puts @player_board.render(show = true)
          puts "Enter the 3 coordinates for cruiser:"
            coord_input = gets.chomp
            coord_input = coord_input.split
# require "pry"; binding.pry
          if @player_board.valid_placement?(@cruiser, coord_input)
            @player_board.place(@cruiser, coord_input)
            break
          end
      elsif
        input == "q"
        puts "You are the weakest link, goodbye."
        break
      else
        puts "Invalid entry. Please choose p or q."
      end
    end
  end

end

# loop do
  @game = Game.new(@player_board, @computer_board)
  @game.main_menu
