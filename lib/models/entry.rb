class Entry < ActiveRecord::Base

  belongs_to :book
  belongs_to :list
    
end