#  Ruby program that will run the checkers game
require_relative 'config/environment'


# Run ruby.rb file
# Prompts the user for player 1’s name
# Saves player.find_or_create_by_name(name) into local variable player_1
# Prompts the user for player 2’s name
# Saves player.find_or_create_by_name(name) into local variable player_2
# game = Checks if there exists a board with the 2 players
# if(game) // if game exists
# 			prompt.select(“start new game/Load old game”, [start new game, Load old game] 
# if(user chooses new game)
# 	game.destroy
#  	game = Board.new(params)
# Else
# game	
# 		Else
# 			Game = Board.new(params)
# Game.load (creates instances of pieces)
