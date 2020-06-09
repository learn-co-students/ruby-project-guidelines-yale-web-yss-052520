require_relative '../config/environment'


sidlist = List.find(1)
arthurlist = List.find(2)

cujo = Book.find(1)
east = Book.find(2)

king = find_or_create_author_by_full_name("Stephen King")


binding.pry
0

# t.string "title"
# t.integer "author_id"
# t.string "genre"
# t.integer "year"
# t.string "link"
# t.string "format"
# t.string "notes"
# t.boolean "read?"