class List < ActiveRecord::Base

  has_many :entries
  has_many :books, through: :entries

  
  def add_book_to_list(title:, authorname:, year: nil, genre: nil)
    author = find_or_create_author_by_full_name(authorname)
    if Book.where(title: title, author_id: author.id).first
      create_entry(Book.where(title: title, author_id: author.id).first)
    else
      newbook = Book.create(title: title, author_id: author.id, year: year, genre: genre)
      create_entry(newbook)
    end
    self.reload
  end

  private

  def create_entry(book)
    Entry.create(list_id: self.id, book_id: book.id)
  end
    
end

