require './lib/game'

loop do
  game = Game.new
  puts "Welcome to BATTLESHIP"
  puts "Enter p to play. Enter q to quit."
  input = gets.chomp
  if input == "p"
    game.start_game
  elsif
    input == "q"
    puts "You are the weakest link, goodbye."
    break
  else
    puts "Invalid entry. Please choose p or q."
  end
end
