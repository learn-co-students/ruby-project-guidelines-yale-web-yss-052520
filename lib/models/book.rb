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
    self.genre = genre.downcase
  end

  def entries
    Entry.all.select{|e| e.book == self}
  end

  def lists
    entries.map{|e| e.list}
  end

  def toggle_read
    self.toggle(:read)
  end

  def self.find_by_title(title)
    Book.all.find_by(title: title)
  end
    
end