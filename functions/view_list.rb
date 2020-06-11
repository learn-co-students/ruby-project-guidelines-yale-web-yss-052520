require_relative '../config/environment'
require 'pry'

def view_list(selected, sortstring)
    system("clear")
    puts selected.name
    puts "-"*100
    sleep(0.2)

    display_table(selected, sortstring)
    
    # $prompt.ask('')


    $prompt.select("What do you want to do?") do |menu|
        menu.choice "Sort list", -> {choose_sort(selected)}
        menu.choice "Add a new book", -> {add_entry(selected)}
        menu.choice "View/edit a book record", -> {select_book(selected)}
        menu.choice "Back to my lists", -> {view_all}
        menu.choice "Delete this list", -> {delete_list(selected)
        view_all}
        menu.choice "Back to main menu", -> {system("clear")
        main_menu}
    end


end


def select_book(list)
    book_num = $prompt.ask("Enter the number of the book you want to access.", convert: :int)
    book = list.sort_by_id[book_num-1]
    edit_book(book, list)
   # binding.pry
end