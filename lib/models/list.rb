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

  def entries
    Entry.all.select{|e| e.list == self}
  end

  def books #returns an array of instances of books in the list
    entries.map{|e| e.book}.uniq
  end

  def sort_by_title
    self.books.sort_by(&:title)
  end

  def sort_by_author
    self.books.sort_by {|book| book.author.last_name}
  end

  # def sort_by_with_nil(attr)
  #   self.books.reject{|b| b.attr.nil?}.sort_by(&:attr) +
  #   self.books.select{|c| c.attr.nil?}
  # end

  def sort_by_genre
    self.books.reject{|b| b.genre.nil?}.sort_by(&:genre) +
    self.books.select{|c| c.genre.nil?}
  end

  def sort_by_year
    self.books.reject{|b| b.year.nil?}.sort_by(&:year) +
    self.books.select{|c| c.year.nil?}
  end

  def sort_by_year_desc
    self.books.reject{|b| b.year.nil?}.sort_by(&:year).reverse! +
    self.books.select{|c| c.year.nil?}
  end

  def sort_by_read
    self.books.sort_by(&:read)
  end

  def mark_all_as_read
    self.books.each do |b| 
      b.update(read: true)
    end
  end


 ######################################################################################################
  private

  def create_entry(book)
    Entry.create(list_id: self.id, book_id: book.id)
  end
    
end

