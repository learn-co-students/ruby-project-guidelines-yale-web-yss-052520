class Player < ActiveRecord::Base # instances of this class are stored in the players table of the database
    
    # has_many :boards # each player can have an infnite number of saved, in-progress games that they are involved in
    # has_many :boards, :class_name => 'Board', :foreign_key => 'l_player_id'
    # has_many :boards, :class_name => 'Board', :foreign_key => 'r_player_id'
    def boards
        Board.where("r_player_id = ? OR l_player_id = ?", self.id, self.id)
    end

    def self.find_or_create_by_name(name)	
        player = Player.find_by(name: name)
        if(player)
            puts "Welcome back to Digital Checkers, #{player.name}!"
        else
            player = Player.create(name: name)
            puts "Welcome to Digital Checkers, #{player.name}!"
        end
        player
    end
    
end