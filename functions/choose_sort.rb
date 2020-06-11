require_relative '../config/environment'

def choose_sort(selected)
  $prompt.select("Sort by:") do |menu|
    menu.choice "Title", -> {view_list(selected, "sort_by_title")}
    menu.choice "Author", -> {view_list(selected, "sort_by_author")}
    menu.choice "Year", -> {view_list(selected, "sort_by_year")}
end

end