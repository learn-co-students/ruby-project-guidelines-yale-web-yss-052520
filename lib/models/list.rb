class List < ActiveRecord::Base

  has_many :entries
  has_many :books, through: :entries
    
end