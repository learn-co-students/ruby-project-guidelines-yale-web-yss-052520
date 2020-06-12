require_relative '../config/environment'

def view_book(book, list)

  system("clear")

  display_entry(book)

  $prompt.select("What do you want to do?") do |menu|
    menu.choice "Edit this book record", -> {edit_book(book, list)}
    menu.choice "Toggle read/unread", -> {toggle_read(book, list)}
    menu.choice "Delete this book record", -> {delete_entry(book, list)}
    menu.choice "Back to list", -> {view_list(list, "sort_by_author")}
    menu.choice "Exit Program", -> {exit}
  end

end

def toggle_read(book, list)
  book.toggle!(:read)
  view_book(book, list)
end