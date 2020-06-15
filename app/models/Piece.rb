class Piece #instances of this class are not stored in the database since they are only relevant to the active game (and there can be many inactive games)
    
    # since this is not an ActiveRecord, we need to create attribute macros and initialize method ourselves

    attr_reader :team, :symbol # color is an inherent property of the piece and can't be changed
    attr_accessor :x_pos, :y_pos # x and y position can be changed

    @@all = [] # stores all the living pieces on the active board

    def initialize( x_pos, y_pos, team, symbol)
        @x_pos = x_pos
        @y_pos = y_pos
        @team = team
        @symbol = symbol

        @@all << self
    end

    # deletes all the active pieces if a board is saved or finished
    def self.clear
        @@all = []
    end

    def self.all
        @@all
    end

    # calculates all the regular moves (directly adjacent diagonals)
    def regular_moves
        moves = [] # initializes empty move array

        # choses "forward" y direction based on piece team
        if @team == "l"
            dir = 1
        else
            dir = -1
        end
        
        # looks at the two forward diagonal positions and adds them to moves array if there are no pieces there
        pos1 = [@x_pos + 1, @y_pos + dir]
        moves << pos1 if Piece.all.none?{|p| [p.x_pos, p.y_pos] == pos1}
        pos2 = [@x_pos - 1, @y_pos + dir]
        moves << pos2 if Piece.all.none?{|p| [p.x_pos, p.y_pos] == pos2}
        
        # deletes any moves with coordinates that aren't on the board
        moves.delete_if{|move| move.find{|n| n < 0 || n > 7}}
        return moves 
    end

    # calculates all the jump moves (diagnonals one square away)
    def jump_moves
        moves = [] # initializes empty move array

        # choses "forward" y direction based on piece team
        if @team == "l"
            dir = 1
        else
            dir = -1
        end

        # looks at the two forward far diagonal positions and adds them to moves array if there are no pieces there and an opponent piece in between
        pos1 = [@x_pos + 2, @y_pos + 2*dir]
        moves << pos1 if Piece.all.find{|p| p.x_pos == @x_pos + 1 && p.y_pos == @y_pos + dir && p.team != @team} && Piece.all.none?{|p| [p.x_pos, p.y_pos] == pos1}
        pos2 = [@x_pos - 2, @y_pos + 2*dir]
        moves << pos2 if Piece.all.find{|p| p.x_pos == @x_pos - 1 && p.y_pos == @y_pos + dir && p.team != @team} && Piece.all.none?{|p| [p.x_pos, p.y_pos] == pos2}
    

        # deletes any moves with coordinates that aren't on the board
        moves.delete_if{|move| move.find{|n| n < 0 || n > 7}}
        return moves
    end

end