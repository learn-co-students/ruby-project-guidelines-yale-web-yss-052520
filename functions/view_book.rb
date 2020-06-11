require_relative '../config/environment'

def view_book(book, list)

  display_entry(book)

  $prompt.select("What do you want to do?") do |menu|
    menu.choice "Edit this book record", -> {edit_book(book, list)}
    menu.choice "Delete this book record", -> {book.destroy}
    menu.choice "Back to list", -> {view_list(list)}
    menu.choice "Exit Program", -> {exit}
    # menu.choice "Hang out for a bit", -> {hang_out(0.5,5)}
  end

end