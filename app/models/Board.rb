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
        puts self.content
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
    # TODO: try more efficient code
    def update

        new_board = [
            "⬜⬛⬜⬛⬜⬛⬜⬛",
            "⬛⬜⬛⬜⬛⬜⬛⬜",
            "⬜⬛⬜⬛⬜⬛⬜⬛",
            "⬛⬜⬛⬜⬛⬜⬛⬜",
            "⬜⬛⬜⬛⬜⬛⬜⬛",
            "⬛⬜⬛⬜⬛⬜⬛⬜",
            "⬜⬛⬜⬛⬜⬛⬜⬛",
            "⬛⬜⬛⬜⬛⬜⬛⬜"]
        
        # Updates every empty cell with piece symbol if a piece exists at that position
        new_board.length.times{|row|
            new_board[row].length.times{|col|
                piece_at_curr_pos = Piece.all.find{|piece| piece.x_pos == col && piece.y_pos == row} 
                p piece_at_curr_pos
                new_board[row][col] = piece_at_curr_pos.symbol if(piece_at_curr_pos)
            }
        }
        self.content = new_board.join("\n")
        self.display
    end


    
    
end