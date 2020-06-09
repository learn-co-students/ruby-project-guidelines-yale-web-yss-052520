class Board < ActiveRecord::Base # instances of this class are stored in the boards table of the database
    
    belongs_to :l_player, :class_name => 'Player', :foreign_key => 'l_player_id'
    belongs_to :r_player, :class_name => 'Player', :foreign_key => 'r_player_id'
    
    # Creates the pieces associatied with the current board configuration
    def load
        grid = contents.split("\n")
        grid.length.times{|row|
            grid[row].length.times{|col|
                if grid[row][col] == 🔴
                    Piece.new(row, col, "right", 🔴)
                else grid[row][col] == 🔵
                    Piece.new(row, col, "left", 🔵)
        self.display
    end

    # Prints out the current configuration of this board's content
    def display        
        # TODO: Find Gem to clear the CLI screen
        p self.content
        if(self.player_turn == 'l')
            p "It is #{Player.find(self.l_player_id)}'s turn!'"
        else
            p "It is #{Player.find(self.r_player_id)}'s turn!'"
        end
    end

    def update
        

    end

end