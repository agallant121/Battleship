require_relative '../lib/board'

class Game
  def initialize(player, computer)
    @player_board = player
    @computer_board = computer
  end

  def main_menu
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    loop do
      input = gets.chomp
      if input == "p"
        puts "render"
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
