
def display_table(selected, sortstring)
  sorted_array = selected.send(sortstring)
  rows = []
  count = 1
  sorted_array.each do |book|
    row = []
    row.push(count, book.title, book.author.full_name, book.year)
    rows << row
    count +=1
  end
  table = Terminal::Table.new :rows => rows, :headings => [' ', 'Title', 'Author', 'Year'], :title => selected.name + "\n" + selected.description
  puts "Press enter for options."
  puts table
end

def display_entry(book)
  row = [[book.title, book.author.full_name, book.year, book.genre, book.read, book.notes, book.link]]
  table = Terminal::Table.new :rows => row, :headings => ['Title', 'Author', 'Year', 'Genre', 'Read?', 'Notes', 'Link']
  puts table
end