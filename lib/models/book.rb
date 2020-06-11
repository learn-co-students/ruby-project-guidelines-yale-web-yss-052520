class Book < ActiveRecord::Base

  belongs_to :author
  has_many :entries
  has_many :lists, through: :entries

  # after_initialize :unread

  # def unread
  #   self.read = false
  # end

  def mark_as_read
    self.read = true
  end

  def set_genre(genre)
    if genre != nil
      self.genre = genre.downcase
    end
  end

  def entries
    Entry.all.select{|e| e.book == self}
  end

  def lists
    entries.map{|e| e.list}
  end
    
end