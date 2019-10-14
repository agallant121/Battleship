require_relative '../lib/board'
require_relative '../lib/cell'
require_relative '../lib/ship'

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

class Game
  def initialize(player, computer)
    @player_board = player
    @computer_board = computer
  end

  def main_menu
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    loop do
      # require "pry"; binding.pry
      input = gets.chomp
      if input == "p"
        puts @player_board.render(show = true)
      elsif
        input == "q"
        puts "Exit game"
      else
        puts "Invalid entry. Please choose p or q."
      end
    end
  end

end

@game = Game.new(@player_board, @computer_board)
@game.main_menu
