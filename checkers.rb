require 'active_record'
require_relative 'config/environment'
require "tty-prompt"

$prompt = TTY::Prompt.new

puts "CLI CHECKERS"

# finds/creates and greets player 1
puts "Player 1: What is your name?"
player_1 = Player.find_or_create_by_name(gets.chomp)
puts "-----------------------------\n"

# finds/creates and greets player 2
puts "Player 2: What is your name?"
player_2 = Player.find_or_create_by_name(gets.chomp)
puts "-----------------------------\n"

# tries to load existing game
game = Board.all.find{ |board| player_1.boards.member? && player_2.board.member?}
if game # there is an existing game
    puts "You have a saved game in progress."
    # ask the user if they want to continue existing game or start new
    loop do
        if prompt.select("What would you like to do?", {"Continue saved game" => true, "Start new game" => false})
            puts "Loading saved game..."
            break
        elsif prompt.yes?("Are you sure? Your saved game will be overwritten")
            game = Board.new(l_player: player_1, r_player: player_2)
        end
    end
else
    puts "Creating new game..."
    game = Board.new(l_player: player_1, r_player: player_2)
end

# instantiates pieces according to board config
game.load