def display_book_commands
  puts "To edit: type 'edit' followed by a field name. To delete this record: type 'delete'."
end

def display_list_commands
  puts "To view a book, enter its number. For a menu of sorting options, type 'sort'."
end

def display_table(sorted_array)
  rows = []
  count = 1
  sorted_array.each do |book|
    row = []
    row.push(count, book.title, book.author.full_name, book.year)
    rows << row
    count +=1
  end
  table = Terminal::Table.new :rows => rows, :headings => [' ', 'Title', 'Author', 'Year']
  display_list_commands
  puts table
end

def display_entry(book)
  row = [[book.title, book.author.full_name, book.year, book.genre, book.read, book.notes, book.link]]
  table = Terminal::Table.new :rows => row, :headings => ['Title', 'Author', 'Year', 'Genre', 'Read?', 'Notes', 'Link']
  display_book_commands
  puts table
end