class Author < ActiveRecord::Base

  has_many :books

  def full_name
    self.first_name + " " + self.last_name
  end
    
end

def parse_first_name(fullname)
  fullname.gsub(/\s.+/, '')
end

def parse_last_name(fullname)
  fullname.partition(" ").last
end

def find_or_create_author_by_full_name(fullname)
  first = parse_first_name(fullname)
  last = parse_last_name(fullname)
  if Author.where(first_name: first, last_name: last).first
    Author.where(first_name: first, last_name: last).first
  else
    Author.create(first_name: first, last_name: last)
  end
end