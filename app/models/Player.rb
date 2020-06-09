class Player < ActiveRecord::Base # instances of this class are stored in the players table of the database
    
    has_many :boards # each player can have an infnite number of saved, in-progress games that they are involved in
    
end