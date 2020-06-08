class Official < ActiveRecord::Base
    has_many :emails 
    has_many :users, through: :emails 

    attr_reader :name, :location, :email, :role

    def initialize(name, location, email, role)
        @name = name 
        @location = location 
        @email = email 
        @role = role 
    end 


end 