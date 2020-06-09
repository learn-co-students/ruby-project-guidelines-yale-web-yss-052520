class Book < ActiveRecord::Base

  belongs_to :author
  has_many :entries
  has_many :lists, through: :entries

  def mark_as_read
    self.read = true
  end

  def set_genre(genre)
    self.genre = genre
  end
    
end