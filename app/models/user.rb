 
class User < ActiveRecord::Base
    has_many :emails 
    has_many :officials, through: :emails 
end 