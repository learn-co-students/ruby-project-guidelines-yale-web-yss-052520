require 'pry'

def delete_list(list)
  confirm = $prompt.yes?('Are you sure you want to delete this list?', convert: :boolean)
  if confirm == true
      list.destroy
      system("clear")
      puts "#{list.name} has been deleted."
      main_menu
  else
    view_list(list, "sort_by_author")
  end
end

def delete_entry(book, list)
  confirm = $prompt.yes?('Are you sure you want to delete this book?', convert: :boolean)
  if confirm == true
    entry = Entry.find_by(book_id: book.id, list_id: list.id)
    entry.destroy
    system("clear")
    puts "#{book.title} has been deleted from #{list.name}."
    view_list(list, "sort_by_author")
  else
    edit_book(book, list)
  end
end