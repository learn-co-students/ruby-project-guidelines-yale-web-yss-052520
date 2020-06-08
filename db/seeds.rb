king = Author.create(first_name: "Stephen", last_name: "King")
kundera = Author.create(first_name: "Milan", last_name: "Kundera")
steinbeck = Author.create(first_name: "John", last_name: "Steinbeck")

sid_list = List.create(name: "Sidney is Going To Read Stephen King's Entire Body of Work 2k20", description: "Or Die Trying")
arthur_list = List.create(name: "2020 Reading List", description: "lalala")

cujo = Book.create(title: "Cujo", author_id: king.id, year: 1981, format: "book", read?: false)
east = Book.create(title: "East of Eden", author_id: steinbeck.id, year: 1952, format: "book", read?: false)

cujosid = Entry.create(list_id: sid_list.id, book_id: cujo.id)
eastarthur = Entry.create(list_id: arthur_list.id, book_id: east.id)
