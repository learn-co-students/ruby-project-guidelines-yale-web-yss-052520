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

    def start_game(board)
        loop do 
            move = get_move(board)
            move_type = validate_move(move[:piece], move[:to_x], move[:to_y]) # Returns nil if its not a valid move
            if(move_type == nil)
                puts "That is not a valid move"
            end
            execute_move(move[:piece], move_type, move[:to_x], move[:to_y])
            board.switch_player
            board.update
            board.display
        end
    end
    
    def get_move(board)
        move = {:to_X => nil, :to_Y => nil,:piece => nil}
        loop do
            puts "Please enter your move in the proper format, ex. '11:23'" 
            move_input = gets.chomp
            move_input = move_input.split(":")
            if(!move_input =~ (/^[A-Ha-h][1-8]:[A-Ha-h][1-8]$/)) 
                puts "Please enter your move in the proper format, ex. '11:23'" 
                next #restart get_move loop
            end
            move_input = move_input.split(":")
            from_pos = move_input[0].to_s.to_i
            to_pos = move_input[1].to_s.to_i
            
            move[:to_X] = to_pos[0]
            move[:to_Y] = to_pos[1]
            move[:piece] = Piece.all.find{|piece|piece.x_pos = from_pos[0] && piece.y_pos = from_pos[1]}
            if(!move[:piece])
                puts "There is no piece to move in the specified square\n"
                next #restart get_move loop
            end
            if(move[:piece].team != board.player_turn)
                puts "You can not move your opponent’s piece\n"
                next #restart get_move loop
            end
        
            break # A proper move was inputted
        end
        return move
    end
    
    
end