class Player < ActiveRecord::Base # instances of this class are stored in the players table of the database
    
    # has_many :boards # each player can have an infnite number of saved, in-progress games that they are involved in
    # has_many :boards, :class_name => 'Board', :foreign_key => 'l_player_id'
    # has_many :boards, :class_name => 'Board', :foreign_key => 'r_player_id'
    def boards
        Board.where("r_player_id = ? OR l_player_id = ?", self.id, self.id)
    end


    def self.find_or_create_by_name(name)	
        player_temp = Player.all.find_by(name:name)
        if(player_temp)
            p "Welcome back #{player_temp.name} to Digital checkers!"
        else
            player_temp = Player.new(name)
            print("Welcome #{player.name} to digital checkers"
        end
        player_temp
    end
    
end