class Board < ActiveRecord::Base[6.0] # instances of this class are stored in the boards table of the database
    
    has_many :players # each saved in-progress game has 2 players
    
end