class Board < ActiveRecord::Base # instances of this class are stored in the boards table of the database
    
    belongs_to :l_player, :class_name => 'Player', :foreign_key => 'l_player_id'
    belongs_to :r_player, :class_name => 'Player', :foreign_key => 'r_player_id'
    
    # Creates the pieces associatied with the current board configuration
    def load
        grid = content.split("\n")
 
        grid.length.times{|row|

                grid[row].length.times{|col|
                if grid[row][col] == "🔴"
                    Piece.new(row, col, "right", "🔴")
                elsif grid[row][col] == "🔵"
                    Piece.new(row, col, "left", "🔵")
                end
            }
        }
        self.content = grid.join("\n")

        self.display
    end

    # Prints out the current configuration of this board's content and changes turn
    def display        
        # TODO: Find Gem to clear the CLI screen
        puts self.content
        if(self.player_turn == 'l')
            puts "It is #{self.l_player.name}'s turn!"
            self.player_turn = 'r'
        else
            puts "It is #{self.r_player.name}'s turn!"
            self.player_turn = 'l'
        end
    end

    # Looks through coordinates stored in all pieces and “arrange” them in self.contents
    def update


        # Note for v1 implementation 
            # Need to replace the current position with a blank space in the move function or we will need to
            # add a prev_x and prev_y component to pieces so that we know to remove the moved checker
            # piece from its old position in the configuration string 

        # v2 implementation 
        # new_board = [
        #     "⬜⬛⬜⬛⬜⬛⬜⬛",
        #     "⬛⬜⬛⬜⬛⬜⬛⬜",
        #     "⬜⬛⬜⬛⬜⬛⬜⬛",
        #     "⬛⬜⬛⬜⬛⬜⬛⬜",
        #     "⬜⬛⬜⬛⬜⬛⬜⬛",
        #     "⬛⬜⬛⬜⬛⬜⬛⬜",
        #     "⬜⬛⬜⬛⬜⬛⬜⬛",
        #     "⬛⬜⬛⬜⬛⬜⬛⬜"
        # ]

        # new_board = new_board.join("\n")

        
        # grid = .split("\n")
         


    end

end