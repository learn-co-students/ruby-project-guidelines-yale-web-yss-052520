class Board < ActiveRecord::Base[6.0] # instances of this class are stored in the boards table of the database
    
    belongs_to :l_player, :class_name => 'Player', :foreign_key => 'l_player_id'
    belongs_to :r_player, :class_name => 'Player', :foreign_key => 'r_player_id'
    
end