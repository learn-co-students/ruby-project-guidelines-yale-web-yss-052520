require_relative '../config/environment'

def edit_book_header(book)
    system("clear")
    puts "View/Edit Book"
    puts "-"*100
    display_entry(book)
end

def edit_book(book, list)
    edit_book_header(book)
    edit_menu(book, list)
end


def edit_menu(book, list)
    $prompt.select("Options") do |menu|
        menu.choice "Change read status", -> {mark_read(book, list)}
        menu.choice "Title", -> {edit(book, "title", list)}
        menu.choice "Author", -> {edit(book, "author", list)}
        menu.choice "Year", -> {edit(book, "year", list)}
        menu.choice "Genre", -> {edit(book, "genre", list)}
        menu.choice "Notes", -> {edit(book, "notes", list)}
        menu.choice "Link", -> {edit(book, "link", list)}
        menu.choice "Delete this book record", -> {book.destroy}
        menu.choice "Back to list", -> {view_list(list)}
    end
end


def mark_read(book, list)
    if book.read == false
        book.read = true
    else
        book.read = false     
    end
    edit_book_header(book)
    puts "You updated your read status!"
    edit_menu(book, list)
end

def edit(book, item, list)
    input = $prompt.ask("Enter #{item}:", default: nil)
    if input != nil
        case item
        when "title"
            book.title = input
        when "author"
            book.author = input
        when "year"
            book.year = input.to_i
        when "genre"
            book.set_genre(input)
        when "notes"
            book.notes = input
        when "link"
            book.link = input
        end
    end
    edit_book_header(book)
    puts "You updated #{item}!"
    edit_menu(book, list)
end


# def edit(book, item)
#     input = $prompt.ask("Enter #{item}:", default: nil)
#     record = book.send(item)
#     record = input
#    binding.pry
#     edit_book_header(book)
#     puts "You updated #{item}!"
#     edit_menu(book)
# end

