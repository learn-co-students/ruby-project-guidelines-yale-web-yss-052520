class Board < ActiveRecord::Base # instances of this class are stored in the boards table of the database
    
    belongs_to :l_player, :class_name => 'Player', :foreign_key => 'l_player_id'
    belongs_to :r_player, :class_name => 'Player', :foreign_key => 'r_player_id'
    
    # Creates the pieces associatied with the current board configuration
    def load
        grid = content.split("\n")
        grid.length.times{|row|
                grid[row].length.times{|col|
                if grid[row][col] == "🔴"
                    Piece.new(row, col, "r", "🔴")
                elsif grid[row][col] == "🔵"
                    Piece.new(row, col, "l", "🔵")
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

    # Pseudo code for #move, #regular_moves and #jump_moves
    # def move(old coordinates of piece, new coordinates of piece)
        # Reg_moves = regular_moves(old coordinates)
        # Jump_moves = jump_moves(old_x, old_y)
        # if( new coordinates are in possible reg_moves)
            # Piece_moved = piece.find(old coordinates)
            # Piece_moved.x_pos = new_x
            # Piece_moved.x_pos = new_y
        # elsif (new coordinates are in possible jump_moves)
            # Piece_moved = piece.find(old coordinates)
            # Piece_moved.x_pos = new_x
            # Piece_moved.x_pos = new_y
            # Piece.delete(Piece.all.find(x_pos == (old_x + new_x) / 2  && y_pos == (old_y + new_y) / 2)
    # end


    # def regular_moves(old_x, old_y)
        # possible_moves = []
        # If player_turn = left
            # possible_moves.push([old_x + 1, old_y + 1])
            # possible_moves.push([old_x - 1, old_y + 1])
        # If player_turn = r
            # possible_moves.push([old_x + 1, old_y - 1])
            # possible_moves.push([old_x - 1, old_y - 1])
        # Return possible_moves
    # end


    # jump_moves(old_x, old_y)
        # possible_moves = []
        # If player_turn = left
            # If Piece.all.find( team = r && xpos ==[old_x + 1 && ypos == old_y + 1)
                # possible_moves.push([old_x + 2, old_y + 2])
            # If Piece.all.find( team = r && xpos == old_x - 1 && ypos == old_y + 1])
                # possible_moves.push([old_x - 2, old_y + 2])	
        # If player_turn = r
            # If Piece.all.find( team = left && xpos ==[old_x + 1 && ypos == old_y - 1)
                # possible_moves.push([old_x + 2, old_y  - 2])
            # If Piece.all.find( team = left && xpos == old_x - 1 && ypos == old_y - 1])
                # possible_moves.push([old_x - 2, old_y - 2])	
        # Return regular_moves
    # end


end