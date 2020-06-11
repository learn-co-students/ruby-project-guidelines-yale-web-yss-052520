class User < ActiveRecord::Base
    has_many :emails 
    has_many :officials, through: :emails 

    def createEmail
    	message = 'Hi #{official.name}! \n\tI\'m #{self.name} and I\'m one of your constituents. '\
				  'I\'m writing to urge you to support all measures against anti-black racism and police brutality. '\
				  'I hope you do everything in your power to defund the police, switch to a community-controlled model of policing, '\
				  'dissolve and rebuild the police department based on equitable values, take policing out of our schools, '\
				  ''
    end
end 