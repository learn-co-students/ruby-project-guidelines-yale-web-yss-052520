require_relative '../config/environment'
$prompt = TTY::Prompt.new

def add_entry(current_list)
    system("clear")
    puts "Add New Book"
    puts "-"*100
    sleep(0.5)

    entry = $prompt.collect do
        key(:title).ask('Title?', required: true)
      
        key(:authorname).ask('Author?', required: true)
      
        key(:year).ask('Year? (optional)', default: nil)
        key(:genre).ask('Genre? (optional)', default: nil)
      end

    confirm = $prompt.yes?('Add book to list?', convert: :boolean)
    if confirm == true
        puts "Book added!"
        current_list.add_book_to_list(entry)
        main_menu
    else
        main_menu
    end


end

# cujo = Book.create(title: "Cujo", author_id: king.id, year: 1981, genre: "horror", format: "book")
# def add_book_to_list(title:, authorname:, year: nil, genre: nil)

# add_entry