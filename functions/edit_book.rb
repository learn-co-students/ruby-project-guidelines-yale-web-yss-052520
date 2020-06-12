require_relative '../config/environment'

def edit_book_header(book)
    system("clear")
    puts "View/Edit Book"
    puts "-"*100
    display_entry(book)
    display_search(book)
end

def display_search(book)
    title = book.title
    author = search_author(title)
    date = search_date(title)
    pages = search_pages(title)
    publisher = search_publisher(title)
    genre = search_genre(title)
    puts "Google Books Search"
    puts "-"*100 
    puts "Title: #{title}"
    puts "Author: #{author}"
    puts "Publish date: #{date}"
    puts "Page Count: #{pages}"
    puts "Publisher: #{publisher}"
    puts "Genre: #{genre}"
    puts "-"*100 
end

def edit_book(book, list)
    edit_book_header(book)
    edit_menu(book, list)
end


def edit_menu(book, list)
    $prompt.select("Options") do |menu|
        #menu.choice "Change read status", -> {mark_read(book, list)}
        menu.choice "Title", -> {edit(book, "title", list)}
        menu.choice "Author", -> {edit(book, "author", list)}
        menu.choice "Year", -> {edit(book, "year", list)}
        menu.choice "Genre", -> {edit(book, "genre", list)}
        menu.choice "Notes", -> {edit(book, "notes", list)}
        menu.choice "Link", -> {edit(book, "link", list)}
        menu.choice "Delete this book record", -> {delete_entry(book, list)}
        menu.choice "Back to list", -> {view_list(list, "sort_by_author")}
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
            book.update(title: input)
        when "author"
            book.update(author_id: find_or_create_author_by_full_name(input).id)
        when "year"
            book.update(year: input.to_i)
        when "genre"
            book.update(genre: input)
        when "notes"
            book.update(notes: input)
        when "link"
            book.update(link: input)
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

