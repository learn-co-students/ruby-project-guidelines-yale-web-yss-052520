class Book < ActiveRecord::Base

  belongs_to :author
  has_many :entries
  has_many :lists, through: :entries
    
end