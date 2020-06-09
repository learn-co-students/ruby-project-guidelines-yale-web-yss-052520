king = Author.create(first_name: "Stephen", last_name: "King")
kundera = Author.create(first_name: "Milan", last_name: "Kundera")
steinbeck = Author.create(first_name: "John", last_name: "Steinbeck")

cujo = Book.create(title: "Cujo", author_id: king.id, year: 1981, genre: "horror", format: "book")
east = Book.create(title: "East of Eden", author_id: steinbeck.id, year: 1952, genre: "epic", format: "book")
carrie = Book.create(title: "Carrie", author_id: king.id, year: 1974, format: "book")

sidlist = List.create(name: "Sidney is Going To Read Stephen King's Entire Body of Work 2k20", description: "Or Die Trying")
arthurlist = List.create(name: "2020 Reading List", description: "lalala")

sidlist.add_book_to_list(title: "Cujo", authorname: "Stephen King")
sidlist.add_book_to_list(title: "Carrie", authorname: "Stephen King")
arthurlist.add_book_to_list(title: "East of Eden", authorname: "John Steinbeck")
arthurlist.add_book_to_list(title: "Cujo", authorname: "Stephen King")
arthurlist.add_book_to_list(title: "The Flamethrowers", authorname: "Rachel Kushner")