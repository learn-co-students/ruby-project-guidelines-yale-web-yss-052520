require_relative '../config/environment'


sidlist = List.find(1)
arthurlist = List.find(2)

sidlist.mark_all_as_read


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