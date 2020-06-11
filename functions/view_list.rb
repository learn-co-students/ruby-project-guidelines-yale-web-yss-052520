require_relative '../config/environment'
require 'pry'

def view_list(selected)
    system("clear")
    puts selected.name
    puts "-"*100
    sleep(0.5)

    display_table(selected.sort_by_id)
    
    # $prompt.ask('')


    $prompt.select("What do you want to do?") do |menu|
        menu.choice "Sort by:", -> {choose_sort}
        menu.choice "Add a new book", -> {add_entry(selected)}
        menu.choice "View/edit a book record", -> {select_book(selected)}
        menu.choice "Back to my lists", -> {view_all}
        menu.choice "Back to main", -> {main_menu}
        menu.choice "Delete this list", -> {selected.destroy
        view_all}
        menu.choice "Exit Program", -> {exit}
        # menu.choice "Hang out for a bit", -> {hang_out(0.5,5)}
    end


end


def select_book(list)
    book_num = $prompt.ask("Enter the number of the book you want to access.", convert: :int)
    book = list.sort_by_id[book_num-1]
    edit_book(book, list)
   # binding.pry
end