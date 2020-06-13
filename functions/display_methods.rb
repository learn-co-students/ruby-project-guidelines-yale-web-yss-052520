
def display_table(selected, sortstring)
  sorted_array = selected.send(sortstring)
  rows = []
  sorted_array.each do |book|
    row = []
    row.push(book.title, book.author.full_name, book.year, book.genre, book.read)
    rows << row
  end
  if selected.description
    table_title = selected.name + "\n" + selected.description
  else
    table_title = selected.name
  end
  table = Terminal::Table.new :rows => rows, :headings => ['Title', 'Author', 'Year', 'Genre', 'Read?'], :title => table_title
 # puts "Press enter for options."
  puts table
end

def display_entry(book)
  row = [[book.title, book.author.full_name, book.year, book.genre, book.read, book.notes, book.link]]
  table = Terminal::Table.new :rows => row, :headings => ['Title', 'Author', 'Year', 'Genre', 'Read?', 'Notes', 'Link']
  puts table
end