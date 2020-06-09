class List < ActiveRecord::Base

  has_many :entries
  has_many :books, through: :entries

  



    
end

def parse_first_name(fullname)
  fullname.gsub(/\s.+/, '')
end

def parse_last_name(fullname)
  fullname.partition(" ").last
end
