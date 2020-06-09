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

def find_author_by_full_name(fullname)
  first = parse_first_name(fullname)
  last = parse_last_name(fullname)
  Author.where(first_name: first, last_name: last)
end