class Player < ActiveRecord::Base # instances of this class are stored in the players table of the database
    # These relationship macros do not accurately describe our model
    # has_many :boards
    # has_many :boards, :class_name => 'Board', :foreign_key => 'l_player_id'
    # has_many :boards, :class_name => 'Board', :foreign_key => 'r_player_id'

    # So we made a custom one:
    def boards
        Board.where("r_player_id = ? OR l_player_id = ?", self.id, self.id)
    end

    # Called at program launch when players input their names as strings
    def self.find_or_create_by_name(name)	
        player = Player.find_by(name: name)
        if(player)
            puts "😁Welcome back to Digital Checkers, #{player.name}!"
        else
            player = Player.create(name: name)
            puts "😁Welcome to Digital Checkers, #{player.name}!"
        end
        player
    end
    
end