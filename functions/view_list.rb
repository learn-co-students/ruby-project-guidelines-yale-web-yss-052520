require_relative '../config/environment'
require 'pry'

def view_list(selected, sortstring)
    system("clear")
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
    title = $prompt.ask("Enter the title of the book you want to view.").to_s
    bookarray = list.find_in_list_by_title(title)
    if bookarray.size == 1
        book = bookarray.first
        view_book(book, list)
    elsif bookarray.size >=2
        author = $prompt.ask("Two or more entries by that title. Please enter author name.").to_s
        book = list.find_in_list_by_title_and_author(title, author).first
        view_book(book, list)
    else
        puts "Sorry, I can't find a book with that title in this list."
        view_list(list, "sort_by_author")
    end

   # binding.pry
end
